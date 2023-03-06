Return-Path: <virtio-comment-return-4716-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2B3C64EC4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 18:44:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D2B0829FC1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 18:44:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8AAB9866C3
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 18:44:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BFE799866BF; Mon,  6 Mar 2023 18:44:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACDC49866BD
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 18:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: orC5zC8iN8ySBQnoYo_NbA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678128264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2AvVtl3ILdzWc+qcnD/1TQ6KdgLcCr2Gf0PxkO5LDE=;
        b=joWjpy30pLa+VbL3Y2/d6R5PMW1RHY21ZamV7LeUHDNca/rrP0Mfn2nB78eUZkSi3d
         U5Abui3HSuLyXFldqI5BJLNnodBEsE8rluYBfY6fgKSP5ZCCS5yiu60i7fCZX7AyOIKG
         BwYFiqDZiZpuSKE2wHFM1AvmkiJSRdGSzAcSjBuM8qUY2gk15HaSpQinWiPEtoIJheUY
         +yPiHzkNjbsHq72J+jUmvG4/UJkO4uDyh2xxowUHfE7wNHpYZh/ON0rV2kWirbD/xVo/
         u8D3AWFqeNgwYat1Dhrao7t8Nn473Wjt4e/GWuzBmBoqg26d/iKxAK9NhQQFnEkW6wbD
         HZpA==
X-Gm-Message-State: AO0yUKWYKnCZhwmvwJOMbR5aKzXCUD8b6hGK9ffXzZ2LbvsGNX2WDLfq
	kR7HRhuq70g5a9hWEsCTAqefvvRrkkicEKivqTe3+3G0uj8nS/V/VxmQse7OoUFBQANOny1BroA
	nV/fzkvZcEk4LY6QmUD/t9H5rNUzZ9ohPTQ==
X-Received: by 2002:adf:eb4b:0:b0:2c6:e744:cf71 with SMTP id u11-20020adfeb4b000000b002c6e744cf71mr6538568wrn.52.1678128264677;
        Mon, 06 Mar 2023 10:44:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/i6N0IggiWRpzoBvWSbyKPsm0o87aU7sarZ+r2OEb5dicNbwfqp2rJLfR8BRWRvHQmP0JFWQ==
X-Received: by 2002:adf:eb4b:0:b0:2c6:e744:cf71 with SMTP id u11-20020adfeb4b000000b002c6e744cf71mr6538551wrn.52.1678128264386;
        Mon, 06 Mar 2023 10:44:24 -0800 (PST)
Date: Mon, 6 Mar 2023 13:44:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Jiri Pirko <jiri@nvidia.com>, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, jasowang@redhat.com,
	cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com,
	nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>
Message-ID: <20230306134108-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <ZAXfegxCfvfLwiJT@nanopsycho>
 <17471553-8981-eef9-656b-098e1acdda14@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <17471553-8981-eef9-656b-098e1acdda14@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] [PATCH v10 04/10] admin: introduce virtio admin
 virtqueues

On Mon, Mar 06, 2023 at 05:37:09PM +0200, Max Gurtovoy wrote:
> 
> 
> On 06/03/2023 14:41, Jiri Pirko wrote:
> > Thu, Mar 02, 2023 at 02:05:06PM CET, mst@redhat.com wrote:
> > > The admin virtqueues will be the first interface to issue admin commands.
> > > 
> > > Currently virtio specification defines control virtqueue to manipulate
> > > features and configuration of the device it operates on. However,
> > > control virtqueue commands are device type specific, which makes it very
> > > difficult to extend for device agnostic commands.
> > > 
> > > To support this requirement in a more generic way, this patch introduces
> > > a new admin virtqueue interface.
> > > 
> > > We also support more than one admin virtqueue, for QoS and
> > > scalability requirements.
> > > 
> > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > > admin.tex   | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > content.tex |  7 +++--
> > > 2 files changed, 79 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/admin.tex b/admin.tex
> > > index 7e28b77..3ffac2e 100644
> > > --- a/admin.tex
> > > +++ b/admin.tex
> > > @@ -155,3 +155,77 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
> > > \field{command_specific_data} and \field{command_specific_result}
> > > depends on these structures and is described separately or is
> > > implicit in the structure description.
> > > +
> > > +\section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}
> > > +
> > > +An administration virtqueue of an owner device is used to submit
> > > +group administration commands. An owner device can have more
> > 
> > I admit I'm confused. You introduce a concept of admin virtqueue, which
> > sounds quite generic to me, usable in future by much more things than
> > "device groups", correct?
> > 
> > If yes, here you say "group administration commands" which contradics
> > that idea. On multiple places the text this patchset introduces
> > this very muych tights to groups. Like in struct virtio_admin_cmd
> > which contains fields very specific to groups.
> > 
> > If no, isn't it a mistake as the admin queue should be here to
> > handle more than just group commands?
> 
> This was my original idea to have various different types of admin
> operations allowed by an AQ. Not only group management.
> Somehow this was changed down the road when MST took ownership :)
> Maybe it's fine as an initial start but this shouldn't restrict the general
> idea.
> 
> I had in mind things like general health commands, log commands, fw upgrade
>

I'm not sure what if anything unifies these though.  I looked at
specific proposals on the table and this covered them, and
scope was already too broad and was not converging because of this.
People are not good at predicting the future, so I confidently
predict that we'll make some changes down the road ;)


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

