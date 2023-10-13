Return-Path: <virtio-comment-return-7715-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBCFCDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:41:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5BECB159D2B
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:41:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 52706986840
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:41:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 492BF986836; Fri, 13 Oct 2023 11:41:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C407986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KxsULi6HN42mKuTvHq7Ffw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197305; x=1697802105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMkpjZo5F7trRX7sbk31leQoU13SMcCRn08z3wG59xE=;
        b=hwkrx2oU1BFxZ8DJ5QZiMCrVMcF4LjsfyR/Wcv1eCusruFoTA2IqictkmD2wZFJu5T
         incoPNB191vKTz22eP1GQ3/RG5KFVUV8AoRuZZQpdBhzmn5QQ/Fi/aRrQXQAfqH+ksd6
         uhvZxWqtlGCgXkvVOZLezXnFejBJGRlCZLQnizG0+WNPMwYlVFXZAnjHX7+scrmouq3r
         3fJae4kRI4ObfpKvUwIsZpKOpsqgEPfJypXbWb2Hv1kF+QI1I37Wg774ah0DDOsehOtS
         SBs2v3nJHfq7TH9uyYZDh5tw9Ksu3s5g0IwlcOen5hfkR1faMurKaNzRVeA2sLrUshHs
         Q3Qg==
X-Gm-Message-State: AOJu0YyE/gLbJ1/LY/AheLFJm/mN7oksYhS7c3yfoMEk7vQGZ+BtbwvT
	9Zj5IQ+CdTERKxW4VnF2/J27ILZqe3Pg5OlSyP/+5MvMLiANpp4NrR9as24xSfmwsrom+VIuKM8
	VBk0g1AWAThxXgkKy3fR/tBV2qawIzsb7Lw==
X-Received: by 2002:a05:6000:1d81:b0:32d:8a4b:2715 with SMTP id bk1-20020a0560001d8100b0032d8a4b2715mr5602049wrb.8.1697197305260;
        Fri, 13 Oct 2023 04:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEemb7GNVVchBPis7l1cCMjRG64Y9YW+IGmEK+LjPJ56Wo+6r0WFKiZr/DCRwIUNso/Tm0XqA==
X-Received: by 2002:a05:6000:1d81:b0:32d:8a4b:2715 with SMTP id bk1-20020a0560001d8100b0032d8a4b2715mr5602023wrb.8.1697197304884;
        Fri, 13 Oct 2023 04:41:44 -0700 (PDT)
Date: Fri, 13 Oct 2023 07:41:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20231013073048-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
 <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEux-kXQ=d_6CVyfhNit4TMJ=V1p8C6XRDXhCLAJDD5kRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEux-kXQ=d_6CVyfhNit4TMJ=V1p8C6XRDXhCLAJDD5kRA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Oct 13, 2023 at 09:15:31AM +0800, Jason Wang wrote:
> > > 1) Only works for SR-IOV member device like VF
> > It can be extended to SIOV member device in future.
> > Today these are the only type of member device virtio has.
> 
> That is exactly what I want to say, it can only work for the
> owner/member model. It can't work when the virtio device is not
> structured like that. And you missed that most of the existing virtio
> devices are not implemented in this model. It means they can't be
> migrated with a pure virtio specific extension. For you, SR-IOV is all
> but this is not true for virtio. PCI is not the only transport and
> SR-IOV is not the only architecture in PCI.

Original version of admin command work supported another group type
including just the device itself. In the end these commands are
just a level of indirection.
Using them for migration was explicitly listed as a use case when they
were introduced.


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

