Return-Path: <virtio-comment-return-3879-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4178B986646
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Jan 2023 03:40:11 +0000 (UTC)
Message-ID: <c85a2341-2402-cc2c-9c8e-2d2dc1cb6876@redhat.com>
Date: Thu, 19 Jan 2023 11:40:02 +0800
MIME-Version: 1.0
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <96c93361-1497-1eb2-7fcb-452696ae6a56@redhat.com>
 <202301171730174296359@sudoinfotech.com>
 <EE1B180C7FB41197+2023011717415699763014@sudoinfotech.com>
 <Y8a/8SH6sk3rgqcr@fedora>
 <CB1D0D0BB5D3E5E6+2023011810151168808928@sudoinfotech.com>
 <Y8f+0fTh1KYXhXSC@fedora>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <Y8f+0fTh1KYXhXSC@fedora>
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: David Hildenbrand <david@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2023/1/18 22:14, Stefan Hajnoczi =E5=86=99=E9=81=93:
> On Wed, Jan 18, 2023 at 10:15:12AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wro=
te:
>> On Tue, 17 Jan 2023 10:34:09 -0500, Stefan wrote:
>>> On Tue, Jan 17, 2023 at 05:41:57PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 w=
rote:
>>>> On Tue, 17 Jan 2023 09:32:05 +0100=EF=BC=8CDavid wrote=EF=BC=9A
>>>>> On 17.01.23 03:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>>> The two diagrams are quite similar. Did you want to highlight a
>>> difference between the two approaches in the diagram?
>> The biggest difference is the VFIO and vDPA frameworks. The vDPA (virtio=
 data path acceleration) kernel framework
>> is a pillar in productizing the end-to-end vDPA solution and it enables =
NIC vendors to integrate their vDPA NIC kernel
>> drivers into the framework as part of their productization efforts.
>> Detailed information reference=EF=BC=9Ahttps://www.redhat.com/en/blog/in=
troduction-vdpa-kernel-framework
> For the sake of the argument, let's assume VFIO can't be used in your
> situation so vDPA is required. The part I don't understand is which
> specific NVMe features you need that virtio-blk lacks?


I can think one:

Avoid guest application migration from NVMe to virtio-blk?

Thanks


>
> Stefan


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

