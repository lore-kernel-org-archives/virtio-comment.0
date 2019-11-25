Return-Path: virtio-comment-return-947-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 810C3985CB0
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Nov 2019 09:46:31 +0000 (UTC)
References: <20191111092046-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067E36E09AC56EB5D3C29A2C5710@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191120081531-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB20673345E995560006031996C54B0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191124100825-mutt-send-email-mst@kernel.org>
 <d10ea92e-4aab-28db-42b2-644b3deeb1df@redhat.com>
 <20191125022719-mutt-send-email-mst@kernel.org>
 <5730ce35-19fc-e707-1113-30fe24caaeaa@redhat.com>
 <20191125031208-mutt-send-email-mst@kernel.org>
 <d8ba4b97-5835-6a7e-f32a-d46ba5dfa9dd@redhat.com>
 <20191125032811-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fb80e7be-8421-8446-6027-a941ffa282c7@redhat.com>
Date: Mon, 25 Nov 2019 17:46:21 +0800
MIME-Version: 1.0
In-Reply-To: <20191125032811-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Subject: Re: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re: [PATCH]
 virtio-net: Add equal-sized receive buffers feature
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2019/11/25 =E4=B8=8B=E5=8D=884:30, Michael S. Tsirkin wrote:
> On Mon, Nov 25, 2019 at 04:22:47PM +0800, Jason Wang wrote:
>> On 2019/11/25 =E4=B8=8B=E5=8D=884:18, Michael S. Tsirkin wrote:
>>>>>>> Again I can see how we might want to disallow crazy setups with e.g=
. 1
>>>>>>> byte per buffer. That's just abuse, no guest does that anyway. So a=
sking
>>>>>>> e.g. for a minimal buffer size sounds very reasonable.
>>>>>> One question here is that, the minimal buffer size should depends on=
 various
>>>>>> factors. E.g the ring size. Consider a 256 entries ring, the minimal=
 size
>>>>>> should be 64K/256=3D256 ...
>>>>> I guess you are right. We can make this driver programmable I guess?
>>>>> Basically pass min_buf_len to the device.
>>>> Then it still have the chance to program the min_buf_len to 1?
>>> If it wants to - yes - presumably device won't work as well,
>>> fetching all kind of extra data e.g. unnecessary descriptors.
>>>
>> Technically, device should still work for small packet and drop large
>> packet.
> I am not sure I agree. How is this different from just not being
> sufficient space in the RX ring? We certainly do not want to
> drop packets just because there's not enough buffers -
> it's a temporary condition.


I think not? Spec doesn't forbid e.g 1 byte buffer. So when a large=20
packet come, if we don't drop packet. Device may think no available=20
buffer but driver may think all buffers are available.


>
>
>> Vhost has a bug that will stall RX in the case.
> I think we want to spec this first then.


I agree the clarification in the spec, but it wold be too late for=20
existed drivers?

Thanks


>
>> Will post a fix.
>>
>> Thanks
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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

