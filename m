Return-Path: virtio-comment-return-945-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A618D985CAF
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Nov 2019 08:22:57 +0000 (UTC)
References: <20191110095305-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067B4B98759B7A7BF9FFBE0C5740@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191111092046-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB2067E36E09AC56EB5D3C29A2C5710@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191120081531-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB20673345E995560006031996C54B0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20191124100825-mutt-send-email-mst@kernel.org>
 <d10ea92e-4aab-28db-42b2-644b3deeb1df@redhat.com>
 <20191125022719-mutt-send-email-mst@kernel.org>
 <5730ce35-19fc-e707-1113-30fe24caaeaa@redhat.com>
 <20191125031208-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d8ba4b97-5835-6a7e-f32a-d46ba5dfa9dd@redhat.com>
Date: Mon, 25 Nov 2019 16:22:47 +0800
MIME-Version: 1.0
In-Reply-To: <20191125031208-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Subject: Re: [virtio-comment] Re: [EXT] Re: [virtio-comment] Re: [PATCH]
 virtio-net: Add equal-sized receive buffers feature
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2019/11/25 =E4=B8=8B=E5=8D=884:18, Michael S. Tsirkin wrote:
>>>>> Again I can see how we might want to disallow crazy setups with e.g. =
1
>>>>> byte per buffer. That's just abuse, no guest does that anyway. So ask=
ing
>>>>> e.g. for a minimal buffer size sounds very reasonable.
>>>> One question here is that, the minimal buffer size should depends on v=
arious
>>>> factors. E.g the ring size. Consider a 256 entries ring, the minimal s=
ize
>>>> should be 64K/256=3D256 ...
>>> I guess you are right. We can make this driver programmable I guess?
>>> Basically pass min_buf_len to the device.
>> Then it still have the chance to program the min_buf_len to 1?
> If it wants to - yes - presumably device won't work as well,
> fetching all kind of extra data e.g. unnecessary descriptors.
>

Technically, device should still work for small packet and drop large=20
packet.

Vhost has a bug that will stall RX in the case.

Will post a fix.

Thanks


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

