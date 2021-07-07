Return-Path: <virtio-comment-return-1953-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 402A8986457
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jul 2021 12:11:23 +0000 (UTC)
References: <20210706043334.36359-1-jasowang@redhat.com>
 <20210706043334.36359-2-jasowang@redhat.com>
 <20210706051731-mutt-send-email-mst@kernel.org>
 <CAJaqyWeoc+KQZSc8PWre-G8=F8ph3Wx-E4K4vTY2x111FZTzZA@mail.gmail.com>
 <20210706150459-mutt-send-email-mst@kernel.org>
 <fba096c5-66f9-99ea-1174-e31d19fa01db@nvidia.com>
 <1973b90f-6a78-ded2-5249-8635ef15e67d@redhat.com>
 <20bb67da-fd93-b102-6d08-af693d0951dd@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1a910c55-ab7b-d8a3-2c99-b270fa27b805@redhat.com>
Date: Wed, 7 Jul 2021 20:11:12 +0800
MIME-Version: 1.0
In-Reply-To: <20bb67da-fd93-b102-6d08-af693d0951dd@nvidia.com>
Subject: Re: [virtio-comment] Re: [PATCH V2 1/2] virtio: introduce virtqueue
 state as basic facility
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/7/7 =E4=B8=8B=E5=8D=888:03, Max Gurtovoy =E5=86=99=E9=81=93:
>
> On 7/7/2021 5:50 AM, Jason Wang wrote:
>>
>> =E5=9C=A8 2021/7/7 =E4=B8=8A=E5=8D=887:49, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>>
>>> On 7/6/2021 10:08 PM, Michael S. Tsirkin wrote:
>>>> On Tue, Jul 06, 2021 at 07:09:10PM +0200, Eugenio Perez Martin wrote:
>>>>> On Tue, Jul 6, 2021 at 11:32 AM Michael S. Tsirkin=20
>>>>> <mst@redhat.com> wrote:
>>>>>> On Tue, Jul 06, 2021 at 12:33:33PM +0800, Jason Wang wrote:
>>>>>>> This patch adds new device facility to save and restore virtqueue
>>>>>>> state. The virtqueue state is split into two parts:
>>>>>>>
>>>>>>> - The available state: The state that is used for read the next
>>>>>>> =C2=A0=C2=A0 available buffer.
>>>>>>> - The used state: The state that is used for making buffer used.
>>>>>>>
>>>>>>> Note that, there could be devices that is required to set and=20
>>>>>>> get the
>>>>>>> requests that are being processed by the device. I leave such=20
>>>>>>> API to
>>>>>>> be device specific.
>>>>>>>
>>>>>>> This facility could be used by both migration and device=20
>>>>>>> diagnostic.
>>>>>>>
>>>>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>>>> Hi Jason!
>>>>>> I feel that for use-cases such as SRIOV,
>>>>>> the facility to save/restore vq should be part of a PF
>>>>>> that is there needs to be a way for one virtio device to
>>>>>> address the state of another one.
>>>>>>
>>>>> Hi!
>>>>>
>>>>> In my opinion we should go the other way around: To make features as
>>>>> orthogonal/independent as possible, and just make them work together
>>>>> if we have to. In this particular case, I think it should be=20
>>>>> easier to
>>>>> decide how to report status, its needs, etc for a VF, and then open
>>>>> the possibility for the PF to query or set them, reusing format,
>>>>> behavior, etc. as much as possible.
>>>>>
>>>>> I think that the most controversial point about doing it non-SR IOV
>>>>> way is the exposing of these features/fields to the guest using
>>>>> specific transport facilities, like PCI common config. However I=20
>>>>> think
>>>>> it should not be hard for the hypervisor to intercept them and=20
>>>>> even to
>>>>> expose them conditionally. Please correct me if this guessing was not
>>>>> right and you had other concerns.
>>>>
>>>> Possibly. I'd like to see some guidance on how this all will work
>>>> in practice then. Maybe make it all part of a non-normative section
>>>> for now.
>>>> I think that the feature itself is not very useful outside of
>>>> migration so we don't really gain much by adding it as is
>>>> without all the other missing pieces.
>>>> I would say let's see more of the whole picture before we commit.
>>>
>>> I agree here. I also can't see the whole picture for SRIOV case.
>>
>>
>> Again, it's not related to SR-IOV at all. It tries to introduce basic=20
>> facility in the virtio level which can work for all types of virtio=20
>> device.
>>
>> Transport such as PCI need to implement its own way to access those=20
>> state. It's not hard to implement them simply via capability.
>>
>> It works like other basic facility like device status, features etc.
>>
>> For SR-IOV, it doesn't prevent you from implementing that via the=20
>> admin virtqueue.
>>
>>
>>>
>>> I'll try to combine the admin control queue suggested in previous=20
>>> patch set to my proposal of PF managing the VF migration.
>>
>>
>> Note that, the admin virtqueue should be transport indepedent when=20
>> trying to introduce them.
>>
>>
>>>
>>> Feature negotiation is part of virtio device-driver communication=20
>>> and not part of the migration software that should manage the=20
>>> migration process.
>>>
>>> For me, seems like queue state is something that should be internal=20
>>> and not be exposed to guest drivers that see this as a new feature.
>>
>>
>> This is not true, we have the case of nested virtualization. As=20
>> mentioned in another thread, it's the hypervisor that need to choose=20
>> between hiding or shadowing the internal virtqueue state.
>>
>> Thanks
>
> In the nested environment, do you mean the Level 1 is Real PF with X=20
> VFs and in Level 2 the X VF seen as PFs in the guests and expose=20
> another Y VFs ?


I meant PF is managed in L0. And the VF is assigned to L2 guest. In this=20
case, we can expose the virtqueue state feature to L1 guest for=20
migration L2 guest.


>
> If so, the guest PF will manage the migration for it's Y VFs.=20


Does this mean you want to pass PF to L1 guest?

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

