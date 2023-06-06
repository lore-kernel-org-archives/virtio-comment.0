Return-Path: <virtio-comment-return-6151-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711BDC77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 11:56:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9248E183ACA
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 11:56:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 883069864A2
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 11:56:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7F28998648C; Tue,  6 Jun 2023 11:56:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6ED57986491
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 11:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8fOiRdBmMvu322V3fONr1Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686052588; x=1688644588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/T2TrVAwgcB2zfHrxJ7W31FGRJv6qqLr2dDl+ExGtsE=;
        b=Dp/msxM/EmQfU0uiukLK8DZkA2RdWBhcvq9DSo3r/TZo9vY5DTzP4GRGQxx9cm8X4Z
         4VGBHcmFJfFuORZXEYFeyQ5Y/mf0CFbhEmLAuKxh8hqvLDRt8zmXHX8ejVSLXuXRlhcl
         7Lz68EMuA5TTT8sQIsYDk5ZEKYLjQfrSassmTVigXBadobZif76hk5OmhQzCqWSC1oGV
         uHqEst4CHsavmcYiWoHJeH7fmbcUdtrH1sQ5dMRholZWz7X6cA9eGptoll8D7oUskdhr
         PDaPelpN7V9VogZWBIv6n4CdaPc/lxa1C3eIVIicXWqocnQ1lMPT+pBh+GPE1Sd1gFcW
         u/4Q==
X-Gm-Message-State: AC+VfDwf4F+sfhQYl5bj+Ak62BeLhO/4xwIher4LKR1KSOu9BBegVYsj
	7/1DTH1wN3dP/+gvtfXwTgLF2bJju11JKhcdPQht6WUUos3ACZ05PPKOsBZDW6ZfTLx0LUfQPq5
	PopjLq6Tgk5Yju6kfmaTcy8TgcmPTOgMq+w==
X-Received: by 2002:a5d:608c:0:b0:30e:5284:cbc4 with SMTP id w12-20020a5d608c000000b0030e5284cbc4mr689228wrt.68.1686052588574;
        Tue, 06 Jun 2023 04:56:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/51ogCfsn2ofiSH1Evj9KKSPcB+86tsY5bpcalitMy20NsLLFFL0iyRhBCegMJ2enx4Nj1A==
X-Received: by 2002:a5d:608c:0:b0:30e:5284:cbc4 with SMTP id w12-20020a5d608c000000b0030e5284cbc4mr689201wrt.68.1686052588169;
        Tue, 06 Jun 2023 04:56:28 -0700 (PDT)
Date: Tue, 6 Jun 2023 07:56:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230606073544-mutt-send-email-mst@kernel.org>
References: <20230604105027-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B721C34D85D63FCC1F3DDC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230604174224-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DABA25CA36A5460B13E5DC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605014539-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C14D65D5E10CD23A9F67DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605092859-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3] transport-pci: Introduce legacy
 registers access using AQ

On Mon, Jun 05, 2023 at 10:12:59PM +0000, Parav Pandit wrote:
> Rolling v4 now.

Great thanks! I think the result will be in a good shape from
the ABI point of view. Good job!

I think so far Jason was the only one with significant comments
on the series so let's see what he says.

From my personal POV what will be left to do to get this
feature ready for merging would be

- tightening the language:
- thinking of and addressing all kind of corner cases.


Since by now from our email discussions I have I think
a decent understanding of how the feature is supposed to work
I understand how these things work but I think there are still
things that would be a bit unclear for an unprepared reader.

Just to give a random example, there's no explicit
time where the member kind of switches to the legacy/back to modern
mode. I am guessing setting DRIVER bit through legacy interface
does this. We'll want to list that.

I'll try to help find these issues and maybe even suggest wording.

I've delayed commenting on these until the high level design is agreed
on, didn't want to make you waste time on polishing as the patches
undergo significant changes, and I suggest you do the same in v4: let's
make sure there's a wide agreement on the ABI then focus on the spec
language.



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

