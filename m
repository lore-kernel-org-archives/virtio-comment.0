Return-Path: <virtio-comment-return-6663-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C1EB64DA
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 15:30:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 814672B039
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 15:30:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F4FE9866FA
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 15:30:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 47C059866ED; Fri, 30 Jun 2023 15:30:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3575C9866EE
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jun 2023 15:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: oWCc2q88NxuWAEP8MuQAhg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688139041; x=1690731041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbr7zYObTvs0TeBGE3x2raUKjljJoCtso/F/Z3AaHE8=;
        b=Ch6NhJaKJ4+P3E37sN2aQrFp4b0nCEBnsoqYTCH/3rXKexlKXFQ5CZvzDRYJDXRnvd
         YI4L4GoRJxm2Egk27FGWNX2IRF+bKctUrUQHm5BrSROkxB420lCordsDIwJDTMlRCoSa
         a376QVxvtU3bBjv1tRhlpFaTWXZCUhC4XQhq/S03d0slS8gkY3MSMk7FSFi/IrFvmicL
         bG4PDUK80u+kPXE+wDsC50TrvPdjRr+naRlmHX/zn0L9Q0uQhWDxLkj7OCHMHsM7nhXh
         bteyZPcndutD/sqWl5L4LoPEFh3ciwDWAO9d9KyCTwR+JnDSyIrBqtbDpWZ7jsqnf0AL
         HSVA==
X-Gm-Message-State: ABy/qLaa4lhFqbwC/k5WP1ILa0GFnF9H7HgJBFI0g0FkrvJew1gC56xq
	fMniUA3k5xQdgZtJyypKT3dWXqzRh+mG0dzf8xLIcuDJBgnf4q7ebO5NOyJ6liLkax333klxHer
	GS2dr5PC1xX3a6S1ugIJ7xJy0GxihqwZ/gA==
X-Received: by 2002:adf:fa88:0:b0:313:ec90:ac23 with SMTP id h8-20020adffa88000000b00313ec90ac23mr2340535wrr.13.1688139041026;
        Fri, 30 Jun 2023 08:30:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGoOD0FD1Xt9r+9jrQnPO489xyJMcCpTzg8ZBFWiCq1irmw870o4VZX/9ggKsZfwaRMHl6s2Q==
X-Received: by 2002:adf:fa88:0:b0:313:ec90:ac23 with SMTP id h8-20020adffa88000000b00313ec90ac23mr2340521wrr.13.1688139040741;
        Fri, 30 Jun 2023 08:30:40 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:30:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230630113018-mutt-send-email-mst@kernel.org>
References: <20230628061257-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481ED6C94DE8CC414C3369BDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628123131-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BA1CDA0942170186CB59DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628132122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814D42786A6981467D3FADDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628152125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EAD97F6163C52DF4FF53DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230629030345-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548107B410662A97A3BD1BEFDC2AA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548107B410662A97A3BD1BEFDC2AA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] RE: [PATCH v19] virtio-net:
 support inner header hash

On Fri, Jun 30, 2023 at 11:38:49AM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio-dev@lists.oasis-open.org <virtio-dev@lists.oasis-open.org> On
> > Behalf Of Michael S. Tsirkin
> > Sent: Thursday, June 29, 2023 3:07 AM
> 
> > > > Well SHOULD also does not mean "ok to just ignore".
> > > >
> > > > 	This word, or the adjective "RECOMMENDED", mean that there
> > > > 	   may exist valid reasons in particular circumstances to ignore a
> > > > 	   particular item, but the full implications must be understood and
> > > > 	   carefully weighed before choosing a different course.
> > > >
> > > RECOMMENDED and SHOULD forces the device to support MMIO, which is
> > not good.
> > 
> > You said this already. Let's not repeat ourselves please.
> > 
> > It's a single word. We need to work on a patch, we can argue about small detail
> > once it's posted. It's not in your list of plans so I am guessing we need someone
> > on Red Hat side to work on this?
> 
> Yes, I prefer to work together and before writing the patch.
> As just DMA for config space is only point fix problem.
> So lets discuss in new thread and improve this for config space and also other limitations (like support multi-address VQ).
> 

Interesting.  What is multi-address VQ?

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

