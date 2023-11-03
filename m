Return-Path: <virtio-comment-return-8159-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E275FC4167D
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:39:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 403BD2AD66
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:39:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 180BB986C3E
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:39:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 01E5C986C3B; Fri,  3 Nov 2023 14:39:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E74B7986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 14:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386124875"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208,217";a="386124875"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208,217";a="9742863"
Content-Type: multipart/alternative;
 boundary="------------sQMUaOLFJoNyw0g6s5kPtoPh"
Message-ID: <7e4529fb-ade3-4097-bf04-9fe4733ffa82@intel.com>
Date: Fri, 3 Nov 2023 22:39:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-2-lingshan.zhu@intel.com>
 <PH0PR12MB5481D9B7E8E314D925EE58E3DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481D9B7E8E314D925EE58E3DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: [virtio-comment] Re: [PATCH V2 1/6] virtio: introduce virtqueue state

--------------sQMUaOLFJoNyw0g6s5kPtoPh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/2023 7:35 PM, Parav Pandit wrote:
>> From: Zhu Lingshan<lingshan.zhu@intel.com>
>> Sent: Friday, November 3, 2023 4:05 PM
>>
>> This patch adds new virtqueue facility to save and restore virtqueue state. The
>> virtqueue state is split into two parts:
>>
>> - The available state: The state that is used for read the next
>>    available buffer.
>> - The used state: The state that is used for make buffer used.
>>
>> This will simply the transport specific method implementation. E.g two
>> le16 could be used instead of a single le32). For split virtqueue, we only need
>> the available state since the used state is implemented in the virtqueue itself
>> (the used index).
> Sorry, this does not work.
> Refer to my latest series at [2] that covers used ring elements too.
> Commit change log covered the reasoning.
>
> [2]https://lists.oasis-open.org/archives/virtio-comment/202310/msg00472.html
this patch is to migrate device internal virtqueue state, not in-guest 
or in descriptor states, right?

Can you name any missing fields?


--------------sQMUaOLFJoNyw0g6s5kPtoPh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace"><br>
      <br>
    </font>
    <div class="moz-cite-prefix"><font face="monospace">On 11/3/2023
        7:35 PM, Parav Pandit wrote:<br>
      </font></div>
    <blockquote type="cite"
cite="mid:PH0PR12MB5481D9B7E8E314D925EE58E3DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Zhu Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Friday, November 3, 2023 4:05 PM

This patch adds new virtqueue facility to save and restore virtqueue state. The
virtqueue state is split into two parts:

- The available state: The state that is used for read the next
  available buffer.
- The used state: The state that is used for make buffer used.

This will simply the transport specific method implementation. E.g two
le16 could be used instead of a single le32). For split virtqueue, we only need
the available state since the used state is implemented in the virtqueue itself
(the used index). 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry, this does not work.
Refer to my latest series at [2] that covers used ring elements too.
Commit change log covered the reasoning.

[2] <a class="moz-txt-link-freetext" href="https://lists.oasis-open.org/archives/virtio-comment/202310/msg00472.html">https://lists.oasis-open.org/archives/virtio-comment/202310/msg00472.html</a></pre>
    </blockquote>
    <font face="monospace">this patch is to migrate device internal
      virtqueue state, not in-guest or in descriptor states, right?<br>
      <br>
      Can you name any missing fields?<br>
      <br>
    </font><span style="white-space: pre-wrap">
</span><font face="monospace"><br>
    </font>
  </body>
</html>

--------------sQMUaOLFJoNyw0g6s5kPtoPh--
