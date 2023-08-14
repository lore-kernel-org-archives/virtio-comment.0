Return-Path: <virtio-comment-return-7074-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F75C001DB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 06:18:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 996BB60347
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 06:18:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7F629986371
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 06:18:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6CC2F983F78; Mon, 14 Aug 2023 06:18:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C5AC98633D;
	Mon, 14 Aug 2023 06:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VpgUXpR_1691993920;
Date: Mon, 14 Aug 2023 14:18:40 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230814061840.GA30754@h68b04307.sqa.eu95>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230808082145.GE11361@h68b04307.sqa.eu95>
 <PH0PR12MB54818794DB300C190CD92728DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR12MB54818794DB300C190CD92728DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [virtio-comment] Re: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements

On Mon, Aug 14, 2023 at 05:15:06AM +0000, Parav Pandit wrote:
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Tuesday, August 8, 2023 1:52 PM
> 
> > > Yes, but having single interface for two use cases enables the device
> > implementation to not build driver interface specific infra.
> > > Both can be handled by unified interface.
> > 
> > I reconsidered the number of groups, we don't necessarily have only two groups
> > for the time being (one is RFF, the other is ARFS). For example, the driver may
> > maintain groups with different priorities for RFF itself (for example, according
> > to the number of fields contained in ntuple, etc.), and the driver may also
> > maintain different groups with the same priority for different flow types of
> > ARFS, etc.
> 
> This is fine and covered with the interface.
> Number of supported max groups is device capability that is exposed by the device.
> 
> How many groups to use and which priority assign to each is driver's decision.
> So more than 2 groups is fine and supported by the requirements.

Yes, that's what I want to stress too.

> 
> In Linux net device example, 2 groups seem enough,

Sorry I didn't understand this, are you referring to a net device
documentation or a driver implementation?

> but spec is not limited to it.
> 
> When/if there is switch, it can also create a group and filter prioritize message before it reaches further nic processing.
> But we can keep this aside for now to not complicate the discussion more.

Yes, I noticed Xuan's thread, so this can be discussed in his thread.

Thanks!






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

