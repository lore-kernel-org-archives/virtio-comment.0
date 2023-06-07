Return-Path: <virtio-comment-return-6222-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE898C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3116E1CA248
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25559986669
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:50:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1CB559863EF; Wed,  7 Jun 2023 20:50:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0BED49863F0
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 20:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8ubiDCFHNXacFh-OpiyoMw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686171022; x=1688763022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t47srun5ucmgerURLsEtY/GgfFhg7mk0VfPPGoxpja0=;
        b=ZsBWgTxGPwffTv3mZhT2i2Ldcj6gGHu8SxZw1dkGglrHvTM2ip1CgsaAivsJ0rUCKw
         jbiSfTWboIh1rT09CUB87cAay+SPqNb6AWkN38jQupEwKs7uHrzntESiLr8Ml1y2RO5h
         A4gM8TDMd2j8KjepQ1ItelvBTswbFQilHUKz4DLcS6KI996zVGFHRjRKB5XqMhHL6e5E
         hlWbVuU/U4CH1w0WJsbCGM2nIws9msAe3bz2AlqxG2R9jLVJbRfGNQO7nLpcN62c6z8O
         M5eBdg7xNrmkUFd6Y7ENxQSKtIY3cVPUGsvkTfccapVv8h3xhoJOVrddB9mKLxtmX6SM
         hR9w==
X-Gm-Message-State: AC+VfDx4auZ93epngHktMCQy5RCxJPTjxJnlKDl7bbIO5/kl1xhWQePF
	TI3FqN8XAlL4GC+1SMyzaEgw1r/0BJ0cgMTtmM7MNMthZLWUgsXFQtTLFKaYgPFSg4isutQfJ8x
	9oRrPUycaF7lUTmhtGkotMEtD7Ezn1mNILA==
X-Received: by 2002:a05:6000:1964:b0:2ee:f77f:3d02 with SMTP id da4-20020a056000196400b002eef77f3d02mr4970092wrb.0.1686171022360;
        Wed, 07 Jun 2023 13:50:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58Kwpm+ktEK9Hpwn3Oz7bQ1utpcRD5QwkuIB5/ZGxDiq29t0VH4h/pzyEMD0Lvcldij+FVvQ==
X-Received: by 2002:a05:6000:1964:b0:2ee:f77f:3d02 with SMTP id da4-20020a056000196400b002eef77f3d02mr4970082wrb.0.1686171022038;
        Wed, 07 Jun 2023 13:50:22 -0700 (PDT)
Date: Wed, 7 Jun 2023 16:50:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230607164939-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606185016-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230607162747-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480C6DA479E4DEFAC5E1EC1DC53A@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5480C6DA479E4DEFAC5E1EC1DC53A@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4

On Wed, Jun 07, 2023 at 08:39:11PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 7, 2023 4:36 PM
> > 
> > On Tue, Jun 06, 2023 at 11:08:12PM +0000, Parav Pandit wrote:
> > > We can debate and change from cvq to new cfgvq as part of the journey.
> > > It is fine.
> > 
> > Just to stress, cvq has a bunch of drawbacks. For example it is hard to access
> > from the hypervisor since it's DMA from VF.
> > This is why I think our direction should be to add a vq transport that does all
> > config accesses over admin commands.
> We debate this before, so will write is below.
> > Or maybe I'm wrong.
> > 
> 
> > But, let's distinguish between requirements, and between requirements and
> > design. Getting supported counters is a requirement.
> > Doing this over cvq is a design. Reducing MMIO registers is a requirement. OK?
> 
> Yes, I would write it as reducing MMIO and accessing it over vq of the own device is a requirement.

reducing mmio is a requirement (unrelated to counters btw, it's
general). access over vq is a design point I think.

-- 
MST


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

