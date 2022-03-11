Return-Path: <virtio-comment-return-2811-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8397986642
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Mar 2022 13:49:57 +0000 (UTC)
Message-ID: <70626dae-9d81-5fd2-5b08-8a377042c339@opensynergy.com>
Date: Fri, 11 Mar 2022 14:49:51 +0100
From: Harald Mommer <hmo@opensynergy.com>
MIME-Version: 1.0
Subject: [virtio-comment] Comments on RPMB config space chapter 5.2.14
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Huang Yang <yang.huang@intel.com>, virtio-comment@lists.oasis-open.org
Cc: Lukasz Zawada <Lukasz.Zawada@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hello,

the RPMB specification chapter 5.2.14 "Device configuration layout" says=20
the following:

All fields of this configuration are always available and read-only for=20
the driver.

struct virtio_rpmb_config {
 =C2=A0 u8 capacity;
 =C2=A0 u8 max_wr_cnt;
 =C2=A0 u8 max_rd_cnt;
}

capacity is the capacity of the device (expressed in 128KB units). The=20
values MUST range between 0x00
and 0x80 inclusive.

max_wr_cnt and max_rd_cnt are the maximum numbers of RPMB block count=20
(256B) that can be performed
to device in one request. 0 implies no limitation.

=3D=3D

1.) We have an underlying physical RPMB device we would like to forward=20
to a virtual machine via virtio RPMB. Looks like the physical device has=20
a capacity of 256. 256 > 0x80. And 256 also does not fit in the u8=20
capacity of the structure. Thinking now of cutting to 0x80 to fulfill=20
the exact wording of the specification. Alternatively we might violate=20
the specification and cut to 255 which is the biggest value still=20
fitting in u8 capacity. But nothing of this is satisfying.

2.) Looking at the specification the maximum RPMB block count is 256. In=20
our case the physical device seems to have a max_wr_cnt and max_wr_cnt=20
of 1 so we actually don't have a problem here with the value range of an=20
u8. But strictly speaking 256 which is still an allowed value does also=20
not fit into an u8 so for a physical device allowing a block count of=20
256 a cut down to 255 would have to be done. Nice is different.

It would have been better if all the u8 in the config space were le16=20
not to have those value range problems now. But now it is as it is so=20
I've to cut down now (still unsure which capacity limit to choose) in=20
our implementation. But this is now only working around a specification=20
flaw which should be addressed at some time in the specification itself.

Looking forward to get some comments on this.

Regards
Harald

--=20
Dipl.-Ing. Harald Mommer
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone:  +49 (30) 60 98 540-0 <=3D=3D Zentrale
Fax:    +49 (30) 60 98 540-99
E-Mail: harald.mommer@opensynergy.com

www.opensynergy.com

Handelsregister: Amtsgericht Charlottenburg, HRB 108616B
Gesch=C3=A4ftsf=C3=BChrer/Managing Director: Regis Adjamah


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

