Return-Path: <virtio-comment-return-6961-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15F2C001DF
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 10:12:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E1E0674101
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 10:12:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4F79986602
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 10:12:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C16EC9865F7; Wed,  2 Aug 2023 10:12:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACA799865F9;
	Wed,  2 Aug 2023 10:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="433372578"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="433372578"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="794510529"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="794510529"
Message-ID: <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
Date: Wed, 2 Aug 2023 17:40:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Shahaf Shuler <shahafs@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: proposal: use admin command (and aq) of the device to query
 config space



On 8/2/2023 4:59 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Wednesday, August 2, 2023 2:15 PM
>> Rebasing "transport vq" on admin vq is still in my pipeline, I am currently
>> working on a patch series implementing virtio pci live migration in the
>> spec(carry on Jason and Eugenio's work).
>> I will post it next week and back to transport vq task then.
>>
> Awesome and interesting to us as well.
> I have draft for member device migration admin commands.
> I guess yours will hit the mailing list first, so we can converge on your series.
OK
>
>> For SIOV, I have implemented the interfaces for querying the configurations, for
>> example:
>> 1) Access config space:
>>
>> 247 +\begin{lstlisting}
>> 248 +#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
>> 249 +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
>> 250 +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
>> 251 +
>> 252 +struct virtio_transportq_ctrl_dev_config_get {
>> 253 +       u32 offset;
>> 254 +       u32 size;
>> 255 +};
>> 256 +
>> 257 +struct virtio_transportq_ctrl_dev_config_set {
>> 258 +       u32 offset;
>> 259 +       u32 size;
>> 260 +       u8  data[];
>> 261 +};
>> 262 +\end{lstlisting}
>>
>> I think we can re-use the GET command for SR-IOV, I am afraid SET would be a
>> side-channel attacking surface for SR-IOV.
>>
> Get and set both should be inband for PF, VF, SIOV.
> I don’t see any need to diverge and create any weird combinations differently for 3 different device types.
I am not sure, when passthrough a device to a guest, the guest driver 
ownes the config space of the device,
if we allow changes against the config space through admin vq from host, 
it looks like a risk.
>
>> 2) a specific config, e.g., features:
>>
>> 142 +The features negotiation of managed devices is done by the
>> 143 +following commands:
>> 144 +
>> 145 +\begin{lstlisting}
>> 146 +#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
>> 147 + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
>> 148 + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
>> 149 + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
>> 150 +
>> 151 +struct virtio_transportq_ctrl_dev_features {
>> 152 +        u32 features_len;
>> 153 +        u32 features[features_len];
>> 154 +};
>> 155 +\end{lstlisting}
>>
>> still can re-use the GET commands.
>>
>> Thanks
>> Zhu Lingshan


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

