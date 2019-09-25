"use strict";

const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
const storage = require('@google-cloud/storage');
const path = require('path');
const os = require('os');
const fs = require('fs');
const mkdirp = require('mkdirp-promise');
const spawn = require('child-process-promise').spawn;

const TARGET_MIME_TYPE = 'video/mp4';
const STORAGE_TARGET_DIR = 'videoFiles';
const STORAGE_THUMBNAIL_DIR = 'videoImages';
const DATABASE_DESTINATION = 'videos';

const THUMB_MAX_HEIGHT = 200;
const THUMB_MAX_WIDTH = 200;

function validateObject(object) {
    const filePath = object.name || '';
    const fileDir = path.dirname(filePath);
    // Validate directory path.
    if (fileDir !== STORAGE_TARGET_DIR) {
        console.log(fileDir, ' is not a target directory.');
        return false;
    }
    // Validate MIME type.
    if (object.contentType !== TARGET_MIME_TYPE) {
        console.log('This is not a video.', object.contentType, object.name);
        return false;
    }
    return true
}

exports.onVideoUpload = functions.region('asia-east2').storage.object().onFinalize(async (object) => {
    if (!validateObject(object)) {
        return
    }
    const filePath = object.name || '';
    const fileName = path.basename(filePath);
    const thumbnailPath = path.normalize(path.join(STORAGE_THUMBNAIL_DIR, fileName.split('.')[0] + '.jpg'));
    const thumbnail0Path = path.normalize(path.join(STORAGE_THUMBNAIL_DIR, fileName.split('.')[0] + '-0.jpg'));

    // Local temporary paths.
    const tmpPath = path.join(os.tmpdir(), filePath);
    const tmpDir = path.dirname(tmpPath);
    const tmpThumbnailPath = path.join(os.tmpdir(), thumbnailPath);
    const tmpThumbnailDir = path.dirname(tmpThumbnailPath);
    const tmpThumbnail5Path = path.join(os.tmpdir(), thumbnail0Path);

    // Cloud Storage Bucket.
    const client = new storage.Storage();
    const bucket = client.bucket(object.bucket);

    // Create the temp directory where the storage file will be downloaded.
    await mkdirp(tmpDir);
    console.log('The Directory for download is ', tmpDir);
    await mkdirp(tmpThumbnailDir);
    console.log('The Directory for upload is ', tmpThumbnailDir);

    // Once the image has been uploaded delete the local files to free up disk space.
    const targetRemoveTmpFiles = fs.readdirSync(tmpDir);
    if (targetRemoveTmpFiles.length !== 0) {
        for (let file in targetRemoveTmpFiles) {
            fs.unlinkSync(tmpDir + targetRemoveTmpFiles[file]);
        }
    }
    const targetRemoveTmpThumbnailFiles = fs.readdirSync(tmpThumbnailDir);
    if (targetRemoveTmpThumbnailFiles.length !== 0) {
        for (let file in targetRemoveTmpThumbnailFiles) {
            fs.unlinkSync(tmpThumbnailDir + targetRemoveTmpThumbnailFiles[file]);
        }
    }

    // Download file from bucket.
    await bucket.file(filePath).download({ destination: tmpPath });
    console.log('The file has been downloaded to', tmpPath);
    console.log(fs.readdirSync(tmpDir));

    // Generate a thumbnail using spawn convert -thumbnail.
    await spawn('convert', [tmpPath, '-thumbnail', '200x200>', tmpThumbnailPath]);
    console.log('Thumbnail created at', tmpThumbnailPath);
    console.log(fs.readdirSync(tmpThumbnailDir));

    // Uploading the Thumbnail.
    await bucket.upload(tmpThumbnail5Path, { destination: thumbnail0Path, metadata: { contentType: 'image/jpeg' } });
    console.log('Thumbnail uploaded to Storage at', thumbnail0Path);
});