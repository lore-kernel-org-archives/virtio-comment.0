Return-Path: <virtio-comment-return-5705-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F5CC77B7E
	for <virtio-comment@archiver.kernel.org>; Tue,  2 May 2023 11:40:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 347A716A422
	for <virtio-comment@archiver.kernel.org>; Tue,  2 May 2023 11:40:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85B9F9867AF
	for <virtio-comment@archiver.kernel.org>; Tue,  2 May 2023 11:40:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4246B98670C; Tue,  2 May 2023 11:40:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24C709866C8
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 May 2023 11:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tXhc3j3JPSafKIpXgKXd1Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683027622; x=1685619622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VTZF9obJCGOF/e+cMKpP4l5n103N4hEa3ahs35zebk=;
        b=X8hUKu7HmdqXKZNR9a0AnfbGULVzgDVq8nGSNQ7DJuIVznPhGKT38G8ZESyc/q93vn
         9HCJBM3zabxyHRM0sAow9NQxPn/M9EUq4jbWGN0RMTplOh+tXmMAm1MdrFGJLV2Q8OCu
         qRVmCjv6i/yOo/6gYl2LT2qPr22fqneBqTRjig9uXgxr9XwJTi50u2ysHuYFCIVoPoIF
         nFshAvloOgTKQsQcVHoX93NRU2XOLSo+g784qbkU9Z9uLmk0EvTVE5Y1B1SBEgM371zk
         PU8mNnu422bPE2F4L+smaDwwoBhcV45XzX92T4bPN9Q6StrT72bf7tChAwYwZyR6cUtE
         7PqA==
X-Gm-Message-State: AC+VfDze+r3xMYisFL8uDfvyGHgGJ0mkmIjGA0jq7BHaokGiDs1Hjygq
	K4KNNhWACP/Wufp/qy6VXPzkCZKLmBi9i2e5JBefBZ/zHOhc7G70V9aGBw0/ER1dFWjVJGTmO78
	kp4NOOGSNQCNUym0TfxQWFAFGRNOdC7HgQQ==
X-Received: by 2002:a5d:4e0b:0:b0:304:75b1:4dff with SMTP id p11-20020a5d4e0b000000b0030475b14dffmr11469412wrt.48.1683027622175;
        Tue, 02 May 2023 04:40:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7FDWXPcySSOc3PDCD15dcksl7gXUzypZdR00+4Epp+aKlv5ip+WCUnSAodWqpdy84MGLiOhg==
X-Received: by 2002:a5d:4e0b:0:b0:304:75b1:4dff with SMTP id p11-20020a5d4e0b000000b0030475b14dffmr11469397wrt.48.1683027621887;
        Tue, 02 May 2023 04:40:21 -0700 (PDT)
Date: Tue, 2 May 2023 07:40:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230502073706-mutt-send-email-mst@kernel.org>
References: <20230501224430.485139-1-parav@nvidia.com>
 <20230502033954-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C415A8E662A9F3E9A3F8DC6F9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C415A8E662A9F3E9A3F8DC6F9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 0/2] admin virtqueue fixes

On Tue, May 02, 2023 at 11:34:10AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, May 2, 2023 3:42 AM
> > 
> > On Tue, May 02, 2023 at 01:44:28AM +0300, Parav Pandit wrote:
> > >
> > > Hi Michael,
> > >
> > > Please review these two small fixes for the admin virtqueue patches.
> > > They are on top of your work of v12 at [1].
> > >
> > > Patch summary:
> > > patch-1 removes PCI transport dependency on deprecated migration bit
> > > patch-2 fixes admin command command data type to be u8 similar to
> > > result
> > >
> > > [1]
> > > https://lore.kernel.org/virtio-comment/cover.1682354275.git.mst@redhat
> > > .com/T/#t
> > 
> > I can take 1/2 since that's just removing text. Taking 2/2 will mean more review
> > time before vote - besides me not really liking that change, are you sure it's
> > worth it?
> > Was going to start voting today but if we are still tweaking command format
> > then I can't ...
> >
> There were 4 editorial fixes without which PDF is not readable for v12 and commit message needs update the AQ usage.
> It needs rebase also.
> And these two changes also.
> 
> Given we have 6+ changes, better to make them and ask for vote after that.
> 
> Vote includes spec and commit message content.
> So please roll v13 addressing above to make things easier to vote.
> 
> You said posting too fast is not good. Now one week has passed, so its fine to repost v13 and ask for the vote.

Yes absolutely. I am still debating with myself whether
the change in result from u8 to le64 means I should wait another
week before vote ...


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

