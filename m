Return-Path: <virtio-comment-return-6954-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443A1C001DE
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:52:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 875761CA243
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:52:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 716DF986649
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:52:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5EFBA9865F7; Wed,  2 Aug 2023 08:52:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B5A59865F9;
	Wed,  2 Aug 2023 08:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368420168"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="368420168"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="764137468"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="764137468"
Message-ID: <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
Date: Wed, 2 Aug 2023 16:45:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Shahaf Shuler <shahafs@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20230802000955-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: proposal: use admin command (and aq) of the device to query
 config space



On 8/2/2023 12:20 PM, Michael S. Tsirkin wrote:
> On Tue, Aug 01, 2023 at 07:09:14AM +0000, Parav Pandit wrote:
>> One line proposal:
>> Let's use new admin command and admin q for all device types to query device config space for new fields. (always).
>>
>> Details below.
>>
>> Query of device capabilities and configuration using DMA interface.
>> Need:
>> Currently device configuration space is exposed as read only registers. It is growing rapidly.
>> Some devices may be even multi-functionality device in coming future such as net + clock + rdma device.
>> For a PCI transport implementing such ever-growing capabilities, configuration is burdensome as plain registers.
>> Hence, it is required for the driver to query capabilities and configuration using a DMA interface.
>>
>> Interface requirements:
>> 1. Maintain backward compatibility for existing defined configuration fields to stay as registers.
> This is both too specific and too vague.  I think you mean "device
> should be able to optionally support both config access over DMA and support
> existing transitional and non-transitional virtio pci drivers".
>
>> 2. Any new field added must be accessed via DMA interface, regardless of device implementation (hw/sw etc).
>> Results in single driver code regardless of device implementation.
>> 3. A device must be able to choose, starting from which field driver must query
>> such configuration via DMA interface. This field offset must be greater than currently defined configuration field.
> 2 and 3 look like implementation more than like a requirement.
> Try to think what your actual requirement is.
>
>> 4. Any driver to device query operation must not be mandated to be
>> mediated by the owner device for PCI VFs or SIOV or SF devices. Driver must be able to
>> communicate query capabilities and configuration fields directly to
>> the device regardless of device type being PCI PF, VF, SF/SIOV device uniformly.
> I don't really know what does it mean to communicate directly with SIOV device.
> neither do I know query is and what capabilities are.
>
>> 5. When having multi-functionality device in future, it is desired to not always
>> query all the configuration but may be able to query per-functionality configurations.
>> For example, query only steering capabilities, query only rdma capabilities or query only clock capabilities.
> I don't know what query is and what capabilities are. Do you mean
> "access part of config space"?
>
>
>> 6. The driver should be able to query config/capabilities without
>> polling for the DMA completion, in other words, the driver should be able to get
>> notification from the device when DMA command completes.
>> 7. The driver should be able to utilize existing interrupt vector and/or
>> virtqueue for query and set operation without demanding
>> additional interrupt vector whenever possible.
> additional over what? existing where?
>
>> There are multiple options for DMA interface.
>> Some of these options are listed below that we would like to consider fulfilling above requirements.
>
> Cc: Zhu Lingshan <lingshan.zhu@intel.com>
>
> Zhu Lingshan are you still interested in a transport for SIOV (what was
> called transport vq)? Clearly SIOV needs this as part of the transport.
Hi Michael,

Rebasing "transport vq" on admin vq is still in my pipeline, I am 
currently working
on a patch series implementing virtio pci live migration in the 
spec(carry on Jason and Eugenio's work).
I will post it next week and back to transport vq task then.

For SIOV, I have implemented the interfaces for querying the 
configurations, for example:
1) Access config space:

247 +\begin{lstlisting}
248 +#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
249 +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
250 +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
251 +
252 +struct virtio_transportq_ctrl_dev_config_get {
253 +       u32 offset;
254 +       u32 size;
255 +};
256 +
257 +struct virtio_transportq_ctrl_dev_config_set {
258 +       u32 offset;
259 +       u32 size;
260 +       u8  data[];
261 +};
262 +\end{lstlisting}

I think we can re-use the GET command for SR-IOV, I am afraid SET would 
be a side-channel attacking surface for SR-IOV.

2) a specific config, e.g., features:

142 +The features negotiation of managed devices is done by the
143 +following commands:
144 +
145 +\begin{lstlisting}
146 +#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
147 + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
148 + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
149 + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
150 +
151 +struct virtio_transportq_ctrl_dev_features {
152 +        u32 features_len;
153 +        u32 features[features_len];
154 +};
155 +\end{lstlisting}

still can re-use the GET commands.

Thanks
Zhu Lingshan
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

