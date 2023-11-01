Return-Path: <virtio-comment-return-8079-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256FCC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:37:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5D5DC2B07B
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:37:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B284986BB3
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:37:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3835E986BAD; Wed,  1 Nov 2023 05:37:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2982A986BAE
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 05:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RG6Y61K5Nv2gJBsJzlOtTg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698817070; x=1699421870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPUauaBhqL2RZzbgJRzqPDbeLauZn7bRcC8+UPnUzek=;
        b=KClkpV8BcSH908IQOX7yy9awXEXi4ICcgg/4VfJ8meJtQ7s62CHRUOoQxyrDmsWlx5
         4sCHNzU7llpsm25tFKYFkc7hF6MSjAEpTnVSjra4AyXHoZgwlgLMriwH61Mz/3zETR8H
         MZVA/sQphpqVGg1mxKMioRkeCRt1PJlUg9BVTWJcC5vAWcuhRstG8gp5o6jug4wlhC9+
         pHoHJInFw+E9/ppMNLp72Sme9mOqLoJr3kcXkN3g22QKlra+og7aLaKr27+Jpflml+D4
         LuLu73GjwBvs/JyrWRgC/pjh0EcmmMXPAXRcQ3i7v6YIh8CTy62vA/ukL/iU8zn+BKyH
         b+lg==
X-Gm-Message-State: AOJu0YwZzVBfYFVtoJ5SsnsqaDo6jb3TAecO+l4XULi3jJBWYGBRWHyH
	No2LRHK2+NNURtDFl5MlD6n1TwCOMA7onBH7OBPmU9LhYjAUQv6YwwpM7Wqz+DH1rwzypqlD8LC
	qPb1BdKI4FmREmBBMoInZpMPiHw6R435ataq9erKNyA==
X-Received: by 2002:a05:600c:4ecf:b0:407:8ee2:9986 with SMTP id g15-20020a05600c4ecf00b004078ee29986mr11328069wmq.26.1698817069995;
        Tue, 31 Oct 2023 22:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6HoZjikX4P66ALUzbJcTw5A0CRwF0Z7fVEORR9omPpLh/4rO0Qe/Z+OpH9PQIkqQvuV8exg==
X-Received: by 2002:a05:600c:4ecf:b0:407:8ee2:9986 with SMTP id g15-20020a05600c4ecf00b004078ee29986mr11328059wmq.26.1698817069585;
        Tue, 31 Oct 2023 22:37:49 -0700 (PDT)
Date: Wed, 1 Nov 2023 01:37:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231101013634-mutt-send-email-mst@kernel.org>
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
 <20231027032707-mutt-send-email-mst@kernel.org>
 <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
 <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum

On Wed, Nov 01, 2023 at 12:16:23PM +0800, Jason Wang wrote:
> On Sat, Oct 28, 2023 at 10:36 AM Heng Qi <hengqi@linux.alibaba.com> wrote:
> >
> >
> >
> > 在 2023/10/27 下午3:39, Michael S. Tsirkin 写道:
> > > On Thu, Oct 19, 2023 at 02:17:20PM +0800, Heng Qi wrote:
> > >> virtio-net works in a virtualized system and is somewhat different from
> > >> physical nics. One of the differences is that to save virtio device
> > >> resources, rx may receive packets with partial checksum. However, XDP may
> > >> cause partially checksummed packets to be dropped. So XDP loading conflicts
> > >> with the feature VIRTIO_NET_F_GUEST_CSUM.
> > >>
> > >> This patch lets the device to supply fully checksummed packets to the driver.
> > >> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benefits of
> > >> device verification checksum.
> > >>
> > >> In addition, implementation of some performant devices do not generate
> > >> partially checksummed packets, but the standard driver still need to clear
> > >> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable the
> > >> full checksum offloading, then the driver can load XDP without clearing
> > >> VIRTIO_NET_F_GUEST_CSUM.
> > >>
> > >> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the above
> > >> situation, which provides the driver with configurable receive full checksum
> > >> offload. If the offload is enabled, then the device must supply fully
> > >> checksummed packets to the driver.
> > >>
> > >> Use case example:
> > >> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full checksum
> > >> offload is enabled, after XDP processes a packet with full checksum, the
> > >> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in the stack
> > >> not needing to validate the checksum again. This is useful for guests:
> > >>    1. Bring the driver advantages such as cpu savings.
> > >>    2. For devices that do not generate partially checksummed packets themselves,
> > >>       XDP can be loaded in the driver without modifying the hardware behavior.
> > >>
> > >> Several solutions have been discussed in the previous proposal[1].
> > >> After historical discussion, we have tried the method proposed by Jason[2],
> > >> but some complex scenarios and challenges are difficult to deal with.
> > >> We now return to the method suggested in [1].
> > >>
> > >> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291.html
> > >> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.alibaba.com/
> > >>
> > >> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > >> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > >> ---
> > >> v1->v2:
> > >>      1. Modify full checksum functionality as a configurable offload
> > >>         that is initially turned off. @Jason
> > >>
> > >>   device-types/net/description.tex | 54 ++++++++++++++++++++++++++++----
> > >>   1 file changed, 48 insertions(+), 6 deletions(-)
> > >>
> > >> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > >> index 76585b0..3c34f27 100644
> > >> --- a/device-types/net/description.tex
> > >> +++ b/device-types/net/description.tex
> > >> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> > >>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> > >>       channel.
> > >>
> > >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packets with full checksum.
> > >> +
> > >>   \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
> > >>
> > >>   \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
> > >> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
> > >>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > >>
> > >>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
> > >>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> > > What about all of these:
> > >
> > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >
> > >
> > >
> > > can TSO/UFO/USO work with VIRTIO_NET_F_GUEST_FULL_CSUM as opposed to VIRTIO_NET_F_GUEST_CSUM?
> >
> > Both GUEST_FULL_CSUM and GUEST_CSUM can work with GUEST_TSO/USO/UFO.
> 
> Yes. For software devices I guess it will have a lot of performance
> penalty. So it should be disabled by default anyhow. The idea is to
> delay the csum as late as possible.

But for hardware it's actually better. Maybe we need a flag
to say which offloads are expensive?


> > Their important difference is that if GUEST_CSUM is negotiated, the
> > driver can handle partial checksum.
> >
> > >
> > >
> > >> @@ -390,6 +393,13 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
> > >>   \ref{sec:Device Types / Network Device / Device Operation /
> > >>   Processing of Incoming Packets}~\nameref{sec:Device Types /
> > >>   Network Device / Device Operation / Processing of Incoming Packets} below.
> > >> +
> > >> +\item The VIRTIO_NET_F_GUEST_FULL_CSUM feature indicates that the driver handles
> > >> +  packets with full checksum and does not handle packets with partial checksum,
> > >
> > > So we need to change definition of VIRTIO_NET_F_GUEST_CSUM then.
> > >
> > >
> > > Also this is not exactly right. As defined driver must be able to handle
> > > partial checksum too.
> > >
> > >
> > > How about this:
> > >
> > > - change definition above to just "Driver handles packets with full checksum."
> > >
> > > - if VIRTIO_NET_F_GUEST_FULL_CSUM is set but VIRTIO_NET_F_GUEST_CSUM is
> > >    clear driver requires full checksum
> > >
> > > - if VIRTIO_NET_F_GUEST_FULL_CSUM is clear but VIRTIO_NET_F_GUEST_CSUM is
> > >    set driver supports partial checksum
> > >
> > > - if VIRTIO_NET_F_GUEST_FULL_CSUM and VIRTIO_NET_F_GUEST_CSUM are
> > >    set then the behavior is as you describe: VIRTIO_NET_F_GUEST_CSUM
> > >    takes preference, but you can disable it with VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
> > >    if that is supported.
> >
> > Jason wanted this feature to be enabled only when XDP is loading,
> > and this is the context in which this patch was proposed.
> >
> > How do you pay attention to this?
> 
> I don't see any conflict, or anything I miss?
> 
> Thanks


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

