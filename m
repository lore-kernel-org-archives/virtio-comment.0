Return-Path: <virtio-comment-return-5549-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B556C6FD18
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 16:15:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8AB8C60349
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 16:15:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8533B986630
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 16:15:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7BF98986434; Wed, 19 Apr 2023 16:15:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6CA4C986619
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Apr 2023 16:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RDQgqv9eNkqMQB892QX7kA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681920922; x=1684512922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi0jCiUg+NgVxkDL2+pVJFtd19mgx0wxCt1ImZTqHyU=;
        b=DZuWUFc/Sp1oQVA9+pipWVrS6FV8J2C/3Z/mkI2jwCXR+51csRz3/mWuQ5osEq8CRD
         7k5Ipt/CXdVVyyC4ZPfVMJD3aZrN+T4TDKETI4eVgvTjHSOBg125lkRQi3c6YJ0lo0F5
         +SR1iRSRrkEFNm9bJj76rvrK0YHsxSfrZC5mv4czQK7ji2FSe9Ry3T0N3bQFq8c3rdgv
         +ss1BiV31DDahLbDWj4TTqvtZvoXLVehS2S5ytZzBrutoHu9URf/WTrmCObHAB5KFo0U
         CpwpAUHa3h3RKY2+0SLvVHaYMvpYEEEMCn6xfNDmpspVAZrLuZZSKzGByGtUXyeDge+b
         h5yg==
X-Gm-Message-State: AAQBX9fpduJ2oEcFX1Ccolbhd3shxinA/dqsOtgNM6gz4iGB8g0A22c7
	kvWBvai/HGE67yAAhSPYbTV80JZ+4xwJmy3p9H+vHlAkPKgEJYpPC69B5u8QX8PhNmcsQVJK8/J
	O0zbRpXMJVqDM40sfdbGvUrKk8CzcAvm00A==
X-Received: by 2002:a1c:7509:0:b0:3f0:7f4f:2aa8 with SMTP id o9-20020a1c7509000000b003f07f4f2aa8mr16910236wmc.9.1681920922804;
        Wed, 19 Apr 2023 09:15:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPYAhWI/JGeRpA9RSEkqJXfH16Rx9PCPMiJdFOUSxqg+BNRBd7geRxM8DriXY5rlswMSoVnw==
X-Received: by 2002:a1c:7509:0:b0:3f0:7f4f:2aa8 with SMTP id o9-20020a1c7509000000b003f07f4f2aa8mr16910225wmc.9.1681920922499;
        Wed, 19 Apr 2023 09:15:22 -0700 (PDT)
Date: Wed, 19 Apr 2023 12:15:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230419121514-mutt-send-email-mst@kernel.org>
References: <20230411200358.753101-1-parav@nvidia.com>
 <87bkjkngj6.fsf@redhat.com>
 <PH0PR12MB5481908F52883B1C3BE31A15DC629@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481908F52883B1C3BE31A15DC629@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] device-types/multiple: replace queues with enqueues

On Wed, Apr 19, 2023 at 01:35:32PM +0000, Parav Pandit wrote:
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Wednesday, April 19, 2023 9:33 AM
> > 
> > On Tue, Apr 11 2023, Parav Pandit <parav@nvidia.com> wrote:
> > 
> > > Queue is a verb and noun both. Replacing it with enqueue avoids
> > > ambiguity around plural queues noun vs verb; similar to virtio fs
> > > device description.
> > 
> > Personally, I don't think this patch adds much, but I don't really mind it, either.
> > 
> > >
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  device-types/blk/description.tex   | 2 +-
> > >  device-types/gpio/description.tex  | 4 ++--
> > >  device-types/i2c/description.tex   | 2 +-
> > >  device-types/scsi/description.tex  | 2 +-
> > > device-types/vsock/description.tex | 2 +-
> > >  5 files changed, 6 insertions(+), 6 deletions(-)
> > >
> > 
> > (...)
> > 
> > > diff --git a/device-types/vsock/description.tex
> > > b/device-types/vsock/description.tex
> > > index 105bb30..07909d6 100644
> > > --- a/device-types/vsock/description.tex
> > > +++ b/device-types/vsock/description.tex
> > > @@ -218,7 +218,7 @@ \subsubsection{Buffer Space
> > > Management}\label{sec:Device Types / Socket Device /  \field{buf_alloc} and
> > \field{fwd_cnt} fields.
> > >
> > >  \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket
> > > Device / Device Operation / Receive and Transmit} -The driver queues
> > > outgoing packets on the tx virtqueue and incoming packet
> > > +The driver enqueues outgoing packets on the tx virtqueue and incoming
> > > +packet
> > 
> > "queues (...) on" reads natural to me, but I'd use "to" with "enqueues"... 
> Yes, I agree.
> The driver enqueues outgoing packets to the tx virtqueue reads better to me.

+1

> > can any
> > native speakers comment?
> > 
> > >  receive buffers on the rx virtqueue. Packets are of the following form:
> > >
> > >  \begin{lstlisting}


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

