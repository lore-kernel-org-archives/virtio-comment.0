Return-Path: <virtio-comment-return-6843-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727FFEB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 22:31:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DDA274445
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 22:31:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD43D9867BB
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 22:31:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BB8A79867B3; Wed, 12 Jul 2023 22:31:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A75259867B5
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Jul 2023 22:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ny7R-b76Ou2PFzoWGI4EsQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689201066; x=1691793066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGtpf9mTfPdgY5DszN6NHWBaGZv4tdIKhjeLkWIIaXk=;
        b=ABSA9wlS5EV2p/ldROgN4nbVaZrOEuzFSNWPd0IXkpqcnSLhHzrFxkRuZYd1M4Uq2g
         /4DsSO/VhdJPxoCry1hIBaFeXI8RDDx3OkPiIlhWT5KRo/1RCLqIjE3m+FAHQ9r4zNvc
         QWWqOSC5GzmM87daQ90K0Vm3tCVKaTnLmGqWIpecWqmh3K2tvcLxkkJ9hPDAjZdau/JL
         sMenKZ4myla3bVP+LbJykdwOzS0VhEG4neAeXGFm7Y6YPiuD4ZbJ02/yRGByu+yNJCwj
         M/6cknGWzhh3crnpt9s9sFPCM9fJZriWMCS/wevmtqLnpWHqlVbygM4gAZwm80yl6RMf
         121A==
X-Gm-Message-State: ABy/qLa1GuEsSVGdlHwbz0X6Qz65qAFAYH38JLzKrYRHQYxptvyGIjkN
	CTDNkDnSS9xZ/xW3LGVH5f0KjKTVOfvcyPxyicNtkKCOlO9KL16o+JbrsUycPZA8n1tIx50YPOa
	E6vEfnQgF9TtStFw5336VxOIxDwnFOT/4pA==
X-Received: by 2002:adf:fed1:0:b0:30e:4515:1529 with SMTP id q17-20020adffed1000000b0030e45151529mr16796121wrs.37.1689201066615;
        Wed, 12 Jul 2023 15:31:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHQyt4EBAAUTqZh0ERk/2jba2x46IYFNHhj7RSCxYHb1G/j9CKGFYZIVlkP1xwtuSzZYWsrPQ==
X-Received: by 2002:adf:fed1:0:b0:30e:4515:1529 with SMTP id q17-20020adffed1000000b0030e45151529mr16796106wrs.37.1689201066207;
        Wed, 12 Jul 2023 15:31:06 -0700 (PDT)
Date: Wed, 12 Jul 2023 18:31:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230712183013-mutt-send-email-mst@kernel.org>
References: <20230703152711.106008-1-hengqi@linux.alibaba.com>
 <87pm4xjp4t.fsf@redhat.com>
 <20230712082508-mutt-send-email-mst@kernel.org>
 <87jzv5jo82.fsf@redhat.com>
 <e0e2b21d-a7f9-fbf1-7d93-d142c7a7618a@linux.alibaba.com>
 <87h6q9jm85.fsf@redhat.com>
 <b1b03bfa-45ac-42b8-86d9-aaf47c4704e3@linux.alibaba.com>
 <87edldjgri.fsf@redhat.com>
 <PH0PR12MB548162D04BDB6E3AAD9F05B8DC36A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548162D04BDB6E3AAD9F05B8DC36A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re:
 [PATCH v21] virtio-net: support inner header hash

On Wed, Jul 12, 2023 at 04:52:16PM +0000, Parav Pandit wrote:
> 
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Wednesday, July 12, 2023 11:23 AM
> > 
> > On Wed, Jul 12 2023, Heng Qi <hengqi@linux.alibaba.com> wrote:
> > 
> > > 在 2023/7/12 下午9:25, Cornelia Huck 写道:
> > >> ...while the changes above give me a fine pdf, the html generated is
> > >> broken. The problem seems to originate in the normative references
> > >> that are added in introduction.tex, but I don't see where it goes astray.
> > >>
> > >> [401] [402] [403] [404] (./virtio-v1.2-cs01.aux ! Missing \endcsname
> > >> inserted.
> > >> <to be read again>
> > >>                     \unhbox
> > >> l.49 ...ction}Normative References}}{section.1}{}}
> > >>
> > >> ?
> > >> ! Emergency stop.
> > >> <to be read again>
> > >>                     \unhbox
> > >> l.49 ...ction}Normative References}}{section.1}{}}
> > >>
> > >> (makehtml.sh on master seems to work ok, so it's something in this
> > >> patch...)
> > >>
> > >> Does anyone else manage to spot the problem?
> > >
> > > The problem is that underline cannot be added directly in \textbf, we
> > > need a little modification:
> > >
> > > \textbf{[GRE_rfc2784]} --> \textbf{[GRE\_rfc2784]}
> > > \textbf{[GRE_rfc2890]} --> \textbf{[GRE\_rfc2890]}
> > > \textbf{[GRE_rfc7676]} --> \textbf{[GRE\_rfc7676]}
> > >
> > > After this modification, I can successfully compile pdf on overleaf,
> > > please try this.
> > 
> > I'm afraid that's not the problem (I had tried this and similar changes without
> > success); the pdf generation is already fine, but html still fails with this change
> > (or similar).
> > 
> > [Trying on a standard Fedora 37 with a full texlive install...]
> 
> I will try in 2 hours.

There's no need to use undescores here. Let's just switch to a dash and
be done with it. E.g. GRE-rfc2784


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

