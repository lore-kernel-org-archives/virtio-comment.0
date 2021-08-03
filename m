Return-Path: <virtio-comment-return-2138-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B6CF9863C3
	for <virtio-comment@lists.oasis-open.org>; Tue,  3 Aug 2021 07:55:19 +0000 (UTC)
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com> <874kc727pi.fsf@redhat.com>
 <738e1458-2a54-f534-df62-3be198487e91@nvidia.com>
 <20210802130043-mutt-send-email-mst@kernel.org> <87y29jyrc5.fsf@redhat.com>
 <dd617dee-8c7d-5ca7-5965-ad5d17387fee@redhat.com> <87v94nyqai.fsf@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <1a0d0db2-c3d5-ff49-a659-e7b3264fb07a@nvidia.com>
Date: Tue, 3 Aug 2021 10:55:09 +0300
MIME-Version: 1.0
In-Reply-To: <87v94nyqai.fsf@redhat.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/3/2021 9:51 AM, Cornelia Huck wrote:
> On Tue, Aug 03 2021, Jason Wang <jasowang@redhat.com> wrote:
>
>> =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=882:28, Cornelia Huck =E5=86=99=E9=81=
=93:
>>> On Mon, Aug 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>
>>>> On Mon, Aug 02, 2021 at 07:03:11PM +0300, Max Gurtovoy wrote:
>>>>> There is no much bits left in the generic feature field for all the f=
eatures
>>>>> we would like to add.
>>>>> I mentioned only 5-6 in the above example and it will bring us to bit=
 46
>>>>> already.
>>>>>
>>>>> please think of 5-10 years from today.
>>>>>
>>>> IIUC nothing prevents adding more once we exhaust 64 bits. IMHO it's a=
ctually
>>>> pretty important to make sure the feature negotiation works well
>>>> and covers relevant usecases. If we have limitations preventing that
>>>> I'd like to at least try to fix that not replacing feature negotiation=
 with
>>>> something else.
>>> I recall that we had a discussion about that years ago when we
>>> introduced VERSION_1; we explicitly agreed that we can extend features
>>> beyond 64 bit once we need it. (A quick search did not turn up that mai=
l
>>> exchange, though.)
>>>
>> E.g PCI transport has feature_select.
>>
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le32 device_feature_select;=
=C2=A0=C2=A0=C2=A0=C2=A0 /* read-write */
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le32 device_feature;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* read-only f=
or driver */
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le32 driver_feature_select;=
=C2=A0=C2=A0=C2=A0=C2=A0 /* read-write */
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le32 driver_feature;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* read-write =
*/
>>
>> Technically it can support 32*32 different features.
> MMIO uses a similar scheme; CCW uses
>
> struct virtio_feature_desc {
>         le32 features;
>         u8 index;
> };
>
> so there's plenty of room to spare.

Feature negotiation can be done in admin q level. You don't want this=20
branches in the spec per each transport or device type.

We have an admin command to get all device admin q features and we can=20
create a command to set all the driver supported.

Again, I don't see the point of doing that. If a device is supporting=20
command_A, the driver should be able to use it. Telling the device "hi,=20
I'm going to use command_A in the future" is redundant.

The device knows already how to handle it.


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

