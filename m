Return-Path: <virtio-comment-return-6789-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4F4C0015E
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 08:29:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 902FF2AD4B
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 08:29:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 75B0A986808
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 08:29:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 627C2984091; Fri,  7 Jul 2023 08:29:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F5E59867EB
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Jul 2023 08:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SImL0373MVW4Me_pmy41HA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688718587; x=1691310587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1ONV1iBQfRepNjPPZIvUNChwBnLdd4p40ttUkcv9vw=;
        b=br5EnlIxAbbeVUa2IPQOoNmKkwC8y655lXnqXaLLrU60UHlnYWK4sa7at6goWWwXWL
         gUYyTCtMkWSVaL7sZjHDiTBg8/9jIUtIaXCMxbJVOoYVegj/8s1ymETsFDSBWLqXkanI
         I1gR1fzk9qnwzic23Xp7ryQL0f4wi2rklD/37qzEksAwoarHSHTbSttXlAMEsmi8c4v8
         5FtQMQ0yvW/6GQK5LGFQ8UzjNfp5kegGvUJ25FV2CqTrAAQnx6luIjfP1wpxzHRPFiBO
         WlnCm9D8nHINxQqeupDpw1chEaO5+aN171sx9neaqAhiA3xiivTKbPHjBmFZrhWV+5LA
         xPYA==
X-Gm-Message-State: ABy/qLY71MTjwOJXCX/p6+2ASQawQHWMMBvQtkI5A8jKCIi6m6ffYh3K
	fHEcBY45Dp/nLeUCyh7FL2bTNHwlXunffWpN7CxLFMw9W1JiTxqK/Xc5VwBKu2s2h6rWArZD/Zh
	rVaIpUYgcBu52jDiVNzr6/3ARHwidm17RCA==
X-Received: by 2002:a5d:5087:0:b0:30a:f030:8637 with SMTP id a7-20020a5d5087000000b0030af0308637mr3437060wrt.22.1688718587083;
        Fri, 07 Jul 2023 01:29:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEDS7CtZMOY+EWN1Ut01HOg4cK6yP/BWfvzU7QoGAMgh1JkD8krDHmDfrQg7kw6eNH+XLYEig==
X-Received: by 2002:a5d:5087:0:b0:30a:f030:8637 with SMTP id a7-20020a5d5087000000b0030af0308637mr3437042wrt.22.1688718586708;
        Fri, 07 Jul 2023 01:29:46 -0700 (PDT)
Date: Fri, 7 Jul 2023 04:29:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230707042905-mutt-send-email-mst@kernel.org>
References: <20230706212722.97973-1-parav@nvidia.com>
 <20230706212722.97973-4-parav@nvidia.com>
 <20230706174904-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DF6CC374634FE1A1AAF9DC2DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481DF6CC374634FE1A1AAF9DC2DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v11 3/3] admin: Add group member legacy register access
 commands

On Fri, Jul 07, 2023 at 03:54:31AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, July 6, 2023 6:36 PM
> 
> [..]
> 
> > I notice you decided to silently ignore my suggestion to document how are
> > notifications performed. Repeating myself like this is despiriting for me.
> I am sorry if it appeared that way,
> But no, I didn’t silently ignored.
> 
> I added the description as best I could find it, but you commented about it being messy with mixing up the terminology.
> I rewrote it in v12, it looks better now. Please check.
> 
> > Pls re-add especially since you already document it for the cfg_Write access
> > method anyway.
> > 
> Added without citation to hypervisor etc.
> 
> > 
> > also in a conformance section, document the effect of notification being the
> > same as notification through legacy interface.
> 
> PCI specific things were copied from the current spec reference in the notification capability section.
> All the changes you suggested are done.
> Captured in the change log of v12.
> 
> Thanks a lot.
> Since many parts are rewritten as you suggested in the thread, 
> I prefer to add your Signed-off to in v13 if we need roll it or when it is merged, please apply if you find it appropriate.
> It is at least important to me to add it yours Sign-off.

If you like sure.

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

