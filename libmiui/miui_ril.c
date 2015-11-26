/*
 * Copyright (C) 2015 The Android Open Source Project
 * Written by Dmitry Grinberg, adapted by LuK1337
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

extern int _ZN12NetlinkEvent11NlActionAddE = 1;
extern int _ZN12NetlinkEvent14NlActionRemoveE = 2;

#ifdef LIBMIUI_64BIT

/* status_t Parcel::writeString16 */
extern int _ZN7android6Parcel13writeString16EPKDsm();
extern int _ZN7android6Parcel13writeString16EPKtm() {
    return _ZN7android6Parcel13writeString16EPKDsm();
}

#endif
