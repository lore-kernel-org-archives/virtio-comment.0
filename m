Return-Path: <virtio-comment-return-5754-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AF1C77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 06:30:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 90D0B23D45
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 06:30:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C5DD9866AE
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 06:30:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B5D4983EB5; Thu,  4 May 2023 06:30:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50FCC98663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 06:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5IVs1JKNPImLVGwkd4qowg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683181807; x=1685773807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2weFPdGb3o4iyyG9gMQoEUzj9ZqdfCy+rwR76Nr4AA=;
        b=IwVVE6LLoEKmzXVKovPujvvRUuTo0hh+Y5RKd0aJlxovwkEeM4VCLNMMcQsUiGG2cG
         m2n3V/zh8h4nz+VwxlcJs7P1AsIEXYaoSbGIYFL6COwU1x4j64rSYZwcfux7m2Cf66S/
         IRZbGbg8vXC3Sx88TGey30wfyVD7IsoBUYTk18grLP3kwqbNWd/Ytj+PtqcoXuRaOUdX
         K8EdlZdO5rgzEHCMC00eua1D3iZRC8+jVi6+I/spn+OASm84X4FyQKh2Yg12YSFrb84s
         Wi3j8ywqDsRzPo15d27FkxgP71lQxroTYfylDqIakSS5lsqEJzY36NOhOKssAUNlFI19
         uM/Q==
X-Gm-Message-State: AC+VfDxyrr+af/Eu0wBd04JLZzpJSQCzo3u3P/bUqMObHG8gK8f1fRyo
	aohQ+qHZYf4Wj8+EzgPKRAdX8yC3G5NI3FfuxcC8ROHhur2wdsr+m+xKipl/AWsLzVj8kyTYj9l
	4pMkbGhMcR5NwwLqXPKdpzfOpPlSOv21Usw==
X-Received: by 2002:a1c:7917:0:b0:3f1:6942:e024 with SMTP id l23-20020a1c7917000000b003f16942e024mr17237626wme.27.1683181807023;
        Wed, 03 May 2023 23:30:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4STYu5emRgzxuM18qFl6RII8H9Pb2/TZ4AEiOAbh0oBI4vWV8PTJuVBTnkjGourMOXhWZCuQ==
X-Received: by 2002:a1c:7917:0:b0:3f1:6942:e024 with SMTP id l23-20020a1c7917000000b003f16942e024mr17237597wme.27.1683181806681;
        Wed, 03 May 2023 23:30:06 -0700 (PDT)
Date: Thu, 4 May 2023 02:30:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>
Message-ID: <20230504022948-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-2-parav@nvidia.com>
 <20230503014838-mutt-send-email-mst@kernel.org>
 <36e8746e-9edd-7998-3381-9cee2457f3df@nvidia.com>
 <20230503124848-mutt-send-email-mst@kernel.org>
 <c7cf0054-cfba-57d4-6a3f-bf774751994f@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <c7cf0054-cfba-57d4-6a3f-bf774751994f@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 1/2] transport-pci: Introduce legacy registers access
 commands

On Wed, May 03, 2023 at 01:23:55PM -0400, Parav Pandit wrote:
> 
> 
> On 5/3/2023 12:49 PM, Michael S. Tsirkin wrote:
> > On Wed, May 03, 2023 at 10:49:14AM -0400, Parav Pandit wrote:
> > > 
> > > 
> > > On 5/3/2023 1:50 AM, Michael S. Tsirkin wrote:
> > > > On Wed, May 03, 2023 at 06:26:58AM +0300, Parav Pandit wrote:
> > > 
> > > > > +Legacy registers write admin command follows \field{struct virtio_admin_cmd}.
> > > > > +This command writes legacy registers of a member VF device. Driver should write
> > > > > +appropriate register \field{size} depending on the width of the legacy
> > > > > +common registers or device specific registers.
> > > > > +Driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LREG_WRITE.
> > > > > +Driver sets \field{group_type} to 1 for VFs.
> > > > > +Driver sets \field{group_member_id} to a valid VF number.
> > > > > +
> > > > > +The \field{command_specific_data} has following listed structure format:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_admin_cmd_lreg_wr_data {
> > > > > +	u8 offset; /* Starting byte offset of the register(s) to write */
> > > > > +	u8 size; /* Number of bytes to write into the register. */
> > > > > +	u8 register[];
> > > > 
> > > > And maybe add
> > > > 	u8 reserved[]; /* structure padding to multiple of 8 bytes */
> > > > 
> > > > > +};
> > > Thinking, what do we miss without the padding here?
> > 
> > it's not 100% clear where the padding is.
> > 
> It is same as rest of the other virtio structures as described in "Structure
> Specifications" section.
> 
> "Many device and driver in-memory structure layouts are documented using the
> C struct syntax. All structures
> are assumed to be without additional padding."

exactly, so please include the padding explicitly.


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

