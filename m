Return-Path: <virtio-comment-return-2815-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E05B986338
	for <virtio-comment@lists.oasis-open.org>; Mon, 14 Mar 2022 14:10:00 +0000 (UTC)
References: <70626dae-9d81-5fd2-5b08-8a377042c339@opensynergy.com>
 <DM6PR11MB384948F551208BB1187D7569850C9@DM6PR11MB3849.namprd11.prod.outlook.com>
 <486f583a-2957-0414-5336-545bcf9b0189@opensynergy.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 14 Mar 2022 14:05:58 +0000
In-reply-to: <486f583a-2957-0414-5336-545bcf9b0189@opensynergy.com>
Message-ID: <87r17462x8.fsf@linaro.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Comments on RPMB config space chapter 5.2.14
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Harald Mommer <hmo@opensynergy.com>
Cc: "Huang, Yang" <yang.huang@intel.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Lukasz Zawada <Lukasz.Zawada@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>


Harald Mommer <hmo@opensynergy.com> writes:

> On 11.03.22 17:02, Huang, Yang wrote:
>>  =20
>>> 1.) We have an underlying physical RPMB device we would like to forward=
 to
>>> a virtual machine via virtio RPMB. Looks like the physical device has a
>>> capacity of 256. 256 > 0x80. And 256 also does not fit in the u8 capaci=
ty of the
>> 256*128KB =3D 32MB RPMB. What's your flash, eMMC, UFS or NVMe?
>
> UFS. I should still try to find out what exact chip is used on the
> board and try to confirm with the data sheet (if available) that the
> capacity of 256 we got from ioctl RPMB_IOC_CAP_CMD is indeed the
> correct one. Which means 32MB. just to rule out I'm not fooled by some
> obscure bug somewhere in the stack.

Which stack would this be? If it's one of my test branches I wouldn't
rule out a bug in stack, especially when it comes to handling the config
space. There hasn't been a upstream release of an RPMB driver for Linux
yet.

I'm currently in the middle of having another go that attempts to bridge
the gap between a straight dumb frame pass-through and a slightly more
ergonomic approach that none the less leaves the cryptographic frame
creation to user space.

>
>>> structure. Thinking now of cutting to 0x80 to fulfill the exact wording=
 of the
>>> specification. Alternatively we might violate the specification and cut=
 to 255
>>> which is the biggest value still fitting in u8 capacity. But nothing of=
 this is
>>> satisfying.
>>>
>>> 2.) Looking at the specification the maximum RPMB block count is 256. I=
n our
>
> I'm referring to the virtio specification as it is currently on latest
> master in https://github.com/oasis-tcs/virtio-spec.git.
>
> 2.) is not about the total size of the RPMB device but about the max.
> allowed number of blocks to be read or written at a time in one chunk
> (config space max_wr_cnt and max_rd_cnt). While in the text 256B is
> still a valid value in the config space this value would not fit into
> the u8. Not the issue now but remarkable when we are already in clause
> 5.12.4.


--=20
Alex Benn=C3=A9e

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

