Return-Path: <virtio-comment-return-5736-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F7FC77B78
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 20:08:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E29B139614
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 20:08:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FB579866D8
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 20:08:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 012E69866C9; Wed,  3 May 2023 20:08:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C65599866C0
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 20:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: YqznLE74Nkyz5uBWnfczZg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683144516; x=1685736516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XI6YTHhd1bKfQaeoxTn2WqG+7vEDnQuA46epoKfOmQk=;
        b=kfxJIq8S72DjPjvosOTHRbRAI0L4ZqiD4vU0Bg2bdhL33F8WVMWlstN2Mk+1b7lZY9
         Y7D3HaSq+DFwTqRXkyC9J/93BkSUfx5lRfhI7lNDnTULIoBn2EY6faCMMsZSvyF247cf
         O31maAPcbo+KAFIB5cnIuTpK/lwpS0Db84DbGSZloEqTk68Q22nIdH5J2l9Cj4Z3oxcL
         QOa1D/GAS2EdLknzTQiN3xEUJYneWrii8kUJvM2e2qXQSfZ7wI3ztjWorkll1882kz0g
         Ymv3nByCfcE6whjOQkozWr54APENt2TS8yITbzGvA/Kafz+B7QHinCy2LEhSbGobB7re
         wg6A==
X-Gm-Message-State: AC+VfDxzhFv+Ma47jVjwRyGzz0ve8F5TqZsMbGuia3vAtTm7SxKUkDiv
	JYxi7N+zA6SxEYNKZlo0uThpCYOllPDcAGOOS7mu28HGapZ1km6Wmwp+5CUC0sdCF/MEex+gamx
	erkWoSn9tUHoI/bf1c/nx4iV22mPL8jH08A==
X-Received: by 2002:a05:600c:22d0:b0:3f1:7a57:45cd with SMTP id 16-20020a05600c22d000b003f17a5745cdmr15134627wmg.28.1683144516206;
        Wed, 03 May 2023 13:08:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ534WFTc3xdO9nDVdoGzsDXw32SaAdZ4e3Gy6R0odIXYjidzcIVmJVYny9u26IZpiqsDtRtng==
X-Received: by 2002:a05:600c:22d0:b0:3f1:7a57:45cd with SMTP id 16-20020a05600c22d000b003f17a5745cdmr15134613wmg.28.1683144515895;
        Wed, 03 May 2023 13:08:35 -0700 (PDT)
Date: Wed, 3 May 2023 16:08:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230503160748-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-2-parav@nvidia.com>
 <20230503151908-mutt-send-email-mst@kernel.org>
 <8c9edc69-933a-9202-4495-ef60e2f93c5a@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <8c9edc69-933a-9202-4495-ef60e2f93c5a@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v1 1/2] transport-pci: Introduce legacy
 registers access commands

On Wed, May 03, 2023 at 03:38:31PM -0400, Parav Pandit wrote:
> 
> 
> On 5/3/2023 3:21 PM, Michael S. Tsirkin wrote:
> > On Wed, May 03, 2023 at 06:26:58AM +0300, Parav Pandit wrote:
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_lreg_wr_data {
> > > +	u8 offset; /* Starting byte offset of the register(s) to write */
> > > +	u8 size; /* Number of bytes to write into the register. */
> > > +	u8 register[];
> > > +};
> > 
> > BTW if we don't have padding we could reuse buffer size and won't need
> > size here.
> Yes. sounds good.
> 
> > Do we want to tweak admin command structure generally to use
> > u8 and not le64 for command data then? WDYT?
> > 
> yeah, cmd and result be u8 is fine.
> If padding is needed for perf, may be that command can define the padding.

The commands that I defined do need u64 (much easier to
work on bitmaps in fixed size chunks), so they will use that.

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

