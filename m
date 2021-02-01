Return-Path: virtio-comment-return-1699-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E3A098610E
	for <virtio-comment@lists.oasis-open.org>; Mon,  1 Feb 2021 03:42:41 +0000 (UTC)
References: <20210125055202.29001-1-jasowang@redhat.com>
 <20210127035117-mutt-send-email-mst@kernel.org>
 <e752ecaa-e04c-ecdc-3921-470942a71276@redhat.com>
 <20210129115737.77ea06c5.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a2b3d5e8-63ce-dbe9-0197-155f469a00e9@redhat.com>
Date: Mon, 1 Feb 2021 11:42:31 +0800
MIME-Version: 1.0
In-Reply-To: <20210129115737.77ea06c5.cohuck@redhat.com>
Subject: [virtio-comment] Re: [PATCH V2] virtio-net: introduce admin control virtqueue
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/1/29 =E4=B8=8B=E5=8D=886:57, Cornelia Huck wrote:
> On Thu, 28 Jan 2021 10:58:49 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2021/1/27 =E4=B8=8B=E5=8D=886:59, Michael S. Tsirkin wrote:
>>> Thus, an idea. How about controlling features instead?
>>>
>>> And with that, the interface becomes generic and applicable
>>> to all devices not just net ...
>>
>> Yes, so I think we probably need more than this e.g I had plan to
>> introduce a general admin virtqueue which could be use to replace the
>> transport specific way to configure/probe virtual devices. I think we
>> can add this new features controlling command via that virtqueue.
>>
>> So if this makes sense. I will drop the trust command in this patch and
>> let admin cvq go first. Then I can post general admin virtqueue patch.
>>
>> Does this make sense?
> So, you'd introduce a generic admin virtqueue and give individual
> device types the possibility to use it for device type specific
> commands?


This is mainly for the trust command. The idea is to have a admin=20
virtqueue that is used to manage the features that belongs to a virtual=20
device. And in the admin virtqueue, we can introduce a command like:

VIRTIO_ADMIN_CTRL_DEV_FEATURES

that is used to control the features set of a specific virtual device.=20
Then there's no need for a specialized trust command in the admin=20
control vq for virtio-net.

E.g we can filter out VIRTIO_NET_F_CTRL_MAC_ADDR if we don't want to set=20
mac address via control virtqueue, then the virtual device can't see=20
this feature via cvq (or admin cvq).

Thanks




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

