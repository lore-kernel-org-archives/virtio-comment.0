Return-Path: <virtio-comment-return-6012-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2284FC77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 23 May 2023 18:17:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 52FE316E5A3
	for <virtio-comment@archiver.kernel.org>; Tue, 23 May 2023 18:17:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36D6E9863FB
	for <virtio-comment@archiver.kernel.org>; Tue, 23 May 2023 18:17:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2073E986387; Tue, 23 May 2023 18:17:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B5A79863D0
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 May 2023 18:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: d3ggXNGcOf2stPgN8yDWBw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684865819; x=1687457819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50vp9IUVKc4aJTq7o4kyUrwCeg2bZHDm3SwuEPSUQY4=;
        b=HJIWz4VjTPj2y8WeaoIoK1bqSkbX86SWUwkhKWMvVtKIJtX9NmPFETnb+ereM3zRF4
         epIWiO/Kt5tdYNVmsMhIWzXAWeG+XYeRBOZhqv5xvDaDgbdVHqFtIgRan6KIOUSc8MXm
         SPowrKNRFWTd/FR66ZWxaKmj84vNWG/5r3Y1Eb9FaP2URtX7qtu1ke4oVM5AmF1CD5HX
         AWXSs+JgUPLCqIiPkh7u6u0k9p7Fx8x7AQEGsNTyOoTxwV1vIdQ//yDJ7fpf0ftyvckW
         MFMtKPYb5HJZSPvDOG3N4GyImZwYKvRWc6t/0yPEVGAKKt2K4JC4MAyqtXdtwy8wAOv3
         tBsQ==
X-Gm-Message-State: AC+VfDyb1c54kvgbrty7Hw6S/ClurbdWsKjMb++aMG7EavI51hV3xYxJ
	D6kWcKEr1R81MxDffsehe+27sFK7KBHzgwlfnEEq00wpvatnGMp3Xo5O/XP3F/rd173IB+4wx5N
	f62zNJ9I3M2TjnO99wiElp4tlUYU+Y5hwJw==
X-Received: by 2002:a7b:cb87:0:b0:3f6:37b:6390 with SMTP id m7-20020a7bcb87000000b003f6037b6390mr6476177wmi.32.1684865819653;
        Tue, 23 May 2023 11:16:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Bt4HbmOhM4xDmUp6UIsuGvYVvrY/s/+qlDptoym3KcEaN3HoTDfeEMrF/uCKF1IoIeAj93A==
X-Received: by 2002:a7b:cb87:0:b0:3f6:37b:6390 with SMTP id m7-20020a7bcb87000000b003f6037b6390mr6476161wmi.32.1684865819358;
        Tue, 23 May 2023 11:16:59 -0700 (PDT)
Date: Tue, 23 May 2023 14:16:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230523141439-mutt-send-email-mst@kernel.org>
References: <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <20230511085205-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812F2EFEC7B6A235953A82DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0f75a142-71e9-676a-11ae-a54e6dbb472d@redhat.com>
 <20230515060641-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817BC2F2FBFE3609AFA23CDC789@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817BC2F2FBFE3609AFA23CDC789@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Mon, May 15, 2023 at 02:30:55PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, May 15, 2023 6:09 AM
> > To be more specific, device config often has the same layout under legacy and
> > modern. Thus if getting an offset within device config, same decoding logic
> > should be reusable between legacy and modern.
> Modern device registers are directly accessible from the guest driver without mediation for VF,SF,SIOV.
> Hence, there is no need to have commands for modern register access over some VQ.

Yes, there's need, and some of it you were pushing yourself.
AQ will allow reduced memory with SRIOV, and support for SIOV.

> Will reply to rest of the Jason's comments in some time.


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

