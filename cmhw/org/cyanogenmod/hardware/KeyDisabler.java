/*
 * Copyright (C) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cyanogenmod.hardware;

import android.util.Log;

import java.io.File;

import org.cyanogenmod.hardware.util.FileUtils;

/*
 * Disable capacitive keys
 *
 * This is intended for use on devices in which the capacitive keys
 * can be fully disabled for replacement with a soft navbar. You
 * really should not be using this on a device with mechanical or
 * otherwise visible-when-inactive keys
 */

public class KeyDisabler {

    private static final String TAG = "KeyDisabler";

    private static final String FILE_KEYDISABLER = "/sys/devices/soc.0/f9924000.i2c/i2c-2/2-0070/input/input1/0dbutton";

    /*
     * All HAF classes should export this boolean.
     * Real implementations must, of course, return true
     */

    public static boolean isSupported() {
        return new File(FILE_KEYDISABLER).exists();
    }

    /*
     * Are the keys currently blocked?
     */

    public static boolean isActive() {
        try {
            return Integer.parseInt(FileUtils.readOneLine(FILE_KEYDISABLER)) == 0;
        } catch (Exception e) {
            Log.e(TAG, e.getMessage(), e);
        }
        return false;
    }

    /*
     * Disable capacitive keys
     */

    public static boolean setActive(boolean state) {
        return FileUtils.writeLine(FILE_KEYDISABLER, state ? "0" : "1");
    }

} 
