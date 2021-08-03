Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com> <874kc727pi.fsf@redhat.com>
 <738e1458-2a54-f534-df62-3be198487e91@nvidia.com>
 <20210802130043-mutt-send-email-mst@kernel.org> <87y29jyrc5.fsf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dd617dee-8c7d-5ca7-5965-ad5d17387fee@redhat.com>
Date: Tue, 3 Aug 2021 14:41:28 +0800
MIME-Version: 1.0
In-Reply-To: <87y29jyrc5.fsf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/3 下午2:28, Cornelia Huck 写道:
> On Mon, Aug 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
>> On Mon, Aug 02, 2021 at 07:03:11PM +0300, Max Gurtovoy wrote:
>>> There is no much bits left in the generic feature field for all the features
>>> we would like to add.
>>> I mentioned only 5-6 in the above example and it will bring us to bit 46
>>> already.
>>>
>>> please think of 5-10 years from today.
>>>
>> IIUC nothing prevents adding more once we exhaust 64 bits. IMHO it's actually
>> pretty important to make sure the feature negotiation works well
>> and covers relevant usecases. If we have limitations preventing that
>> I'd like to at least try to fix that not replacing feature negotiation with
>> something else.
> I recall that we had a discussion about that years ago when we
> introduced VERSION_1; we explicitly agreed that we can extend features
> beyond 64 bit once we need it. (A quick search did not turn up that mail
> exchange, though.)
>

E.g PCI transport has feature_select.

         le32 device_feature_select;     /* read-write */
         le32 device_feature;            /* read-only for driver */
         le32 driver_feature_select;     /* read-write */
         le32 driver_feature;            /* read-write */

Technically it can support 32*32 different features.

Thanks

