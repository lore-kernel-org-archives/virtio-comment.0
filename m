Return-Path: <virtio-comment-return-5544-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52268C77B73
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 11:27:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6F3213309E
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 11:27:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6670B98661D
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 11:27:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5AC3D986421; Wed, 19 Apr 2023 11:27:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43AB198641F
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Apr 2023 11:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iLKe2B8RORyXWTu7v0WCIw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681903630; x=1684495630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFqczEftDL2MYvvZFSVmtko2IbvfK3kknmaw5DdyUcc=;
        b=AIwRqzbo36JY6dq4IFNiMgrcs9SPG2132wRWQ8ZeGxBTdFnS4mghwu8+3c9jR/VgNK
         4kyADU5WiwEGKhfkep5Fat/MeNG5WGGGF/s0JlGJrE7tqG60C6h/Zql2ODID1GG0J1h5
         Lje3eCCBNobx0+Wys1WEw618L9lZH/esJ0dtEU3hLypU4UCNcVE9HD62NYuFB70X0MC/
         MLAN2EVNe/Z7CkZB7ADaHJ6a0N/v37f+Icngz3Ah7XQCCoe9c3w1Ib3HftglaexgiAAa
         Z7KzDhmkSgQGAx3H+gWlchuuFml6MYdsedELnIjhFqhCk3oJJDKBNoDP6s2/U0d9yew6
         OWhw==
X-Gm-Message-State: AAQBX9duwwMXFyS1tdvKJY+rLUs9Qvlr37Qnp8ckO81YCJZxaDHyEGz6
	bu9fYA1wC1qPS80xFUBkoUEzMgZvHAlbOlVwz+6Iw0Z0m6asKaZ0qqskm7+kt5BJTuQiuP1lyVu
	ZIuHAQDiXex15NceMMiNgdeW4rySAKjl3AQ==
X-Received: by 2002:a05:600c:cf:b0:3f1:6ef6:c9d7 with SMTP id u15-20020a05600c00cf00b003f16ef6c9d7mr10171394wmm.38.1681903630025;
        Wed, 19 Apr 2023 04:27:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350bZfZLzqWcuQGeyjLLQhUViW7/zzJng1tx8l/wazyhlXN5zl4xFdOvgznUQr/GYGSV0gkUhKQ==
X-Received: by 2002:a05:600c:cf:b0:3f1:6ef6:c9d7 with SMTP id u15-20020a05600c00cf00b003f16ef6c9d7mr10171364wmm.38.1681903629676;
        Wed, 19 Apr 2023 04:27:09 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:27:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230419072522-mutt-send-email-mst@kernel.org>
References: <20230411194220.752355-1-parav@nvidia.com>
 <20230411194220.752355-2-parav@nvidia.com>
 <20230419030057-mutt-send-email-mst@kernel.org>
 <588b201f-8da7-dc6e-d66e-1489914ef051@intel.com>
MIME-Version: 1.0
In-Reply-To: <588b201f-8da7-dc6e-d66e-1489914ef051@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH 1/2] transport-pci: Improve config msix
 vector description

On Wed, Apr 19, 2023 at 04:25:13PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 4/19/2023 3:05 PM, Michael S. Tsirkin wrote:
> > On Tue, Apr 11, 2023 at 10:42:19PM +0300, Parav Pandit wrote:
> > > config_msix_vector is the register that holds the MSI-X vector number
> > > for receiving configuration change related interrupts.
> > > 
> > > It is not "for MSI-X".
> > > 
> > > Hence, replace the confusing text with appropriate one.
> > > 
> > > Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > 
> > > ---
> > > changelog:
> > > v0->v1:
> > > - added 'here'
> > > - dropped 'receiving'
> > > ---
> > >   transport-pci.tex | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > index 42be072..cb9fadd 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -343,7 +343,8 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> > >           Driver Feature Bits selected by \field{driver_feature_select}.
> > >   \item[\field{config_msix_vector}]
> > > -        The driver sets the Configuration Vector for MSI-X.
> > > +        The driver writes an MSI-X vector number here for Configuration change
> > > +        interrupts.
> > Hmm I think it's "the vector", not an. And the order of words
> > is unusual. We also don't normally use "writes here". Would
> > 
> > 	Used by the driver to set the MSI-X vector number for Configuration change interrupts.
> > 
> > be equally acceptable?
> Is it better also explain what is a MSI-X vector number here? Like saying
> the offset in the table or the slot number?
> 
> Thanks,
> Zhu Lingshan

It does, in fact, refer to the MSI-X entry. Vector is in fact the
contents of the entry.  The mixup between vector and entry dates back to
PCI spec which has text like
	While more accurately termed “per-entry masking”, masking an MSI-X Table entry is still
	referred to as “vector masking” so similar descriptions can be used for both MSI and MSI-
	X.


> > 
> > 
> > >   \item[\field{num_queues}]
> > >           The device specifies the maximum number of virtqueues supported here.
> > > -- 
> > > 2.26.2
> > 
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> > 


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

