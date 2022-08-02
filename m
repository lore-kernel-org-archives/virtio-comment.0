Return-Path: <virtio-comment-return-3296-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CADA39864A6
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 Aug 2022 13:37:07 +0000 (UTC)
Message-ID: <8163c60f-9d32-b545-8039-25f36eff8208@intel.com>
Date: Tue, 2 Aug 2022 21:37:00 +0800
MIME-Version: 1.0
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
 <20220801093216.362119-3-lingshan.zhu@intel.com>
 <20220801162534-mutt-send-email-mst@kernel.org>
 <7045124f-1c67-c521-00cf-e86a383586bd@intel.com>
 <20220802024738-mutt-send-email-mst@kernel.org>
 <29533940-0345-4a84-fcc7-f42d914dc28d@intel.com>
 <20220802084742-mutt-send-email-mst@kernel.org>
 <516d6490-e75f-234b-2d20-ea6b4ff39164@intel.com>
 <20220802091729-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20220802091729-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH V2 2/5] Introduce feature bit
 VIRTIO_F_TRANSPT_VQ_MDEV
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 8/2/2022 9:20 PM, Michael S. Tsirkin wrote:
> On Tue, Aug 02, 2022 at 09:15:28PM +0800, Zhu, Lingshan wrote:
>>
>> On 8/2/2022 8:55 PM, Michael S. Tsirkin wrote:
>>> On Tue, Aug 02, 2022 at 07:54:41PM +0800, Zhu, Lingshan wrote:
>>>> On 8/2/2022 2:52 PM, Michael S. Tsirkin wrote:
>>>>> On Tue, Aug 02, 2022 at 11:17:51AM +0800, Zhu, Lingshan wrote:
>>>>>> On 8/2/2022 4:27 AM, Michael S. Tsirkin wrote:
>>>>>>> On Mon, Aug 01, 2022 at 05:32:13PM +0800, Zhu Lingshan wrote:
>>>>>>>> This commit introduces feature bit VIRTIO_F_TRANSPT_VQ_MDEV,
>>>>>>>> which depends on VIRTIO_F_TRANSPT_VQ.
>>>>>>>>
>>>>>>>> Feature bit VIRTIO_F_TRANSPT_VQ_MDEV indicates that the managed
>>>>>>>> devices are created, configured and destroyed through the
>>>>>>>> transport virtqueue, the transport virtqueue is the
>>>>>>>> transport layer for the managed devices.
>>>>>>> I'd avoid the term MDEV if possible, it's already used in virt contexts.
>>>>>> yes, let me work out a better name, it was vdev (virtual device) before, and
>>>>>> maybe
>>>>>> sdev(sub device) or a better one.
>>>>> Besides mdev can thinkably stand for both managed and management.
>>>>> Nvidia patches have the concept of a device group and
>>>>> group member but do not have a name for the device that controls
>>>>> the group. Admin device? Control device?
>>>> maybe management device?
>>> This term has been overused in this context with people saying things
>>> like "the management interface is used by management tools to
>>> manage managed devices" to the point where I'd
>>> rather we avoided it altogether.
>> They are like the parent device and the sub-device, but this is not good
>> enough.
>> It has ever been suggest to use "upstream device" and "downstream device" to
>> replace "master device" and "slave device",
>> but looks not good enough either.
>>
>> The concept should be the management device and the managed device, we never
>> use these terms in virtio spec,
> It's not terrible but it's verbose and if you try to shorten
> you can't tell managed from management apart.
there is only one struct using the shorten term of management device,
struct virtio_mgmt_dev_avail_res{}, and for the managed device,
I think maybe only _dev_ is fine, like
VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE and struct transportq_ctrl_dev_config_get
>
> Also the concept of a group of all devices controlled
> through a single one is missing.
I am not sure what kinds of commands against the device group? Destroy all?
>
>> any better suggestions?
> I gave some above.
>
>>>>> Also, creating/destroying is one thing that seems to only apply to
>>>>> SIOV. configuring seems to apply to SRIOV as well?
>>>> In this series, yes, because actually we can not provision a SRIOV VF with
>>>> dynamic config, and VF provisioning is done through SRIOV cap
>>>>
>>>> Thanks
>>>> Zhu Lingshan
>>> I am not sure what dynamic config means here exactly. Yes creating a VF
>>> itself is not possible. But allocating VQs to it and
>>> e.g. configuring the MAC address of a networking VF can be
>>> done dynamically.
>> I think this config can only be done through the CVQ after provisioning.
>>>>>
>>>>>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>> ---
>>>>>>>>      content.tex | 12 ++++++++++++
>>>>>>>>      1 file changed, 12 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/content.tex b/content.tex
>>>>>>>> index 969ca46..143949e 100644
>>>>>>>> --- a/content.tex
>>>>>>>> +++ b/content.tex
>>>>>>>> @@ -2968,6 +2968,18 @@ \subsection{Managed Devices Dscovery}\label{sec:Virtio Transport Options /Virtio
>>>>>>>>      Managed devices are created and discovered through a transport virtqueue.
>>>>>>>> +\subsection{Transport Virtqueue Features}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Transport Virtqueue Features}
>>>>>>>> +
>>>>>>>> +Feature bit VIRTIO_F_TRANSPT_VQ_MDEV indicates that the managed devices are created, configured
>>>>>>>> +and destroyed through the transport virtqueue.
>>>>>>> Feature bit being present where? On the management device?
>>>>>> Yes, the management device, I will add this.
>>>>>>>> +This means the transport virtqueue is the transport layer for the managed devices.
>>>>>>> confused. how does this differ from VIRTIO_F_TRANSPT_VQ?
>>>>>> VIRTIO_F_TRANSPT_VQ means the management device offers a transport vq.
>>>>>> VIRTIO_F_TRANSPT_VQ_MDEV is a feature of the transport vq, means the
>>>>>> management device create / destroy and configure the managed device via the
>>>>>> transport vq.
>>>>>>
>>>>>> This reminds me that maybe I should use the term vdev(virtual device), so
>>>>>> that other kinds of devices can add their own feature bits under
>>>>>> VIRTIO_F_TRANSPT_VQ
>>>>>>
>>>>>> Thanks,
>>>>>> Zhu Lingshan
>>>>>>>> +
>>>>>>>> +Feature bit VIRTIO_F_TRANSPT_VQ_MDEV depends on VIRTIO_F_TRANSPT_VQ
>>>>>>>> +
>>>>>>>> +\devicenormative{\subsubsection}{Transport Virtqueue Features}{Virtio Transport Options / Virtio Over Transport Virtqueue / Transport Virtqueue Features}
>>>>>>>> +
>>>>>>>> +The management device MUST not accept VIRTIO_F_TRANSPT_VQ_MDEV if VIRTIO_F_TRANSPT_VQ is not negotiated.
>>>>>>>> +
>>>>>>>>      \chapter{Device Types}\label{sec:Device Types}
>>>>>>>>      On top of the queues, config space and feature negotiation facilities
>>>>>>>> -- 
>>>>>>>> 2.35.3
>>>>>>> This publicly archived list offers a means to provide input to the
>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>>
>>>>>>> In order to verify user consent to the Feedback License terms and
>>>>>>> to minimize spam in the list archive, subscription is required
>>>>>>> before posting.
>>>>>>>
>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>>>>
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

