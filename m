Return-Path: <virtio-comment-return-5248-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EB9C76188
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:10:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 12A572B06C
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:10:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E11B49865AA
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:10:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CBC939865A8; Wed,  5 Apr 2023 05:10:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE5E1983DE1
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Apr 2023 05:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zSpVps-cO7WJldKX0d9vQQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680671435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDaXPugbO4ssbTj+DknnyCXmE0fPbNV5AsIwqAIam5w=;
        b=jQhbqGpnsqN8a9fh9GVSz67DD5e9cr7YQrMFkOgdvSb5Sxr3Ea8sx/EgVM/BiRD5Nv
         NEzBiLLl/tcKMuXAR/JvpWqqsU0RkVqHOZsUWTrGt4PbcXqXOJqfoAzvGowFgto5tH+0
         dR1jIoXNDP2tNxLdZ1e7TVz+FsmKcWljZrCDVuEoB6kCNRgtmvNykbnQnx9BsXh177mb
         ka+pAJ1LmGeFHKLikVq7RhkNyQrHNqpXkbsCKtsSm+7tYMBE52Kkx4DBoOhaqosGVdhA
         PcBLGMwW/mLsv11I6nX/nwJeLUy7M9pG5cYaV7yS7/ivyCeDibVGxjnGUXmE0oAPQt5Q
         BBIw==
X-Gm-Message-State: AAQBX9d3JMlJSY9h9zhR4wNlh2rNQN6awyhs2LGFR1pCkuYQhqW2+lmy
	agKaainPLbTvy/IXEzBJcnNfW25xCweCiHPejZNewhiyyOePeCrnlpp9Sn3ooiZRK0vZ+mZLruu
	P0zbsJhTET69bPSOqk+dItEBqOIqj4gWRkA==
X-Received: by 2002:a17:906:6c86:b0:932:e141:29c7 with SMTP id s6-20020a1709066c8600b00932e14129c7mr1545554ejr.19.1680671435286;
        Tue, 04 Apr 2023 22:10:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350aC9kNarE45p5JPnZmYzFxZrDwFttWhBwp59QkEvl4p5nCqciqq4Gm/7fjCNlm1yf/KBwbfMA==
X-Received: by 2002:a17:906:6c86:b0:932:e141:29c7 with SMTP id s6-20020a1709066c8600b00932e14129c7mr1545537ejr.19.1680671434940;
        Tue, 04 Apr 2023 22:10:34 -0700 (PDT)
Date: Wed, 5 Apr 2023 01:10:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230405010807-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <20230404032922-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548157060FCDB5B38CA63C8ADC939@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548157060FCDB5B38CA63C8ADC939@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 08/11] transport-pci: Introduce virtio extended capability

On Tue, Apr 04, 2023 at 09:18:53PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, April 4, 2023 3:35 AM
> 
> > > +Virtio extended PCI Express capability structure defines the location
> > > +of certain virtio device configuration related structures using PCI
> > > +Express extended capability. Virtio extended PCI Express capability
> > > +structure uses PCI Express vendor specific extended capability
> > > +(VSEC). It has a below
> > 
> > a layout below, or the following layout
> > 
> Yes. somehow it got trimmed.
> Will fix it.
> 
> > > +layout:
> > > +
> > > +\begin{lstlisting}
> > > +struct pcie_ext_cap {
> > > +        le16 cap_vendor_id; /* Generic PCI field: 0xB */
> > > +        le16 cap_version : 2; /* Generic PCI field: 0 */
> > > +        le16 next_cap_offset : 14; /* Generic PCI field: next cap or
> > > +0 */ };
> > > +
> > > +struct virtio_pcie_ext_cap {
> > > +        struct pcie_ext_cap pcie_ecap;
> > > +        u8 cfg_type; /* Identifies the structure. */
> > > +        u8 bar; /* Index of the BAR where its located */
> > > +        u8 id; /* Multiple capabilities of the same type */
> > > +        u8 zero_padding[1];
> > > +        le64 offset; /* Offset with the bar */
> > > +        le64 length; /* Length of the structure, in bytes. */
> > > +        u8 data[]; /* Optional variable length data */
> > 
> > Maybe le64 data[], for alignment?
> > 
> It gets harder to decode (typecasting ..) if its string with le64 data type.

In what language? In C you have to cast anyway, string is char *, often
signed, not u8.

> I will extend the comment, 
> 
> +        u8 data[]; /* Optional variable length data, must be aligned to 8 bytes */

I'd keep it le64 or u64, it is highly unlikely we'll pass strings through
this interface anyway.

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

