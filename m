Return-Path: <virtio-comment-return-5167-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE96C76188
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:29:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B2F843309A
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:29:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A60D0986400
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:29:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E0469863DE; Mon,  3 Apr 2023 17:29:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D16B9863E5
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 17:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CgAAI3qxOXWscxPST_LeYQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680542970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC/9g/MZl7CF2omMO4CTZFOQPp5ugJub6fo+y1vGFbo=;
        b=HKqLRrDQyYfaIqwslzpWlL+eRLg5lXbgc6hPYeermxACksY/Ng0QpaZneG1Rd258et
         QNOknUVb/EdlaCVGvVudObg+KjRmdQuWn1MN0BcKJZcAaavAyUvMl46BJRfTEcOcKZq8
         7F9QNRVKvIsH2C28kd/NFDjUlecrX8nlvw9WpZQG6G6B55osGxNjUht59OsaflDWvgT5
         gVNqbBVUFIMXKykr+0KEZCHseqk56xGx59Cwik7oS2otfEthtNx0xHHrIgs8d4duq3h/
         lI3Ruom8cgWlaV/OAz1+tBHtncfy6UHjERFBqariIZSd8DtFNYBinVJ2lTmR2V+RDAD1
         M3gA==
X-Gm-Message-State: AAQBX9e199wpN+KDXq6xBm5h8etSTHjbYzxd+kc7ecrxo7hACTv6LbVZ
	HCR31yZcemT9tmd+pKLMwkAqG4EJk/9FKDDg631mcI85o85s44t/vgLZiMk7oWt+tykCaYOb+Il
	LVHDSq28ucJxkh9/SWcyhPiUQwsd1PfcQ6A==
X-Received: by 2002:a17:906:9f26:b0:947:726e:f43a with SMTP id fy38-20020a1709069f2600b00947726ef43amr12761946ejc.23.1680542969730;
        Mon, 03 Apr 2023 10:29:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350YSqVy0dEmuuX5aogZzJWq0SAJD/Gc+aENghT+ophRDXu3nzgWdKiVxtkiYvd8TnhGnSUuaMA==
X-Received: by 2002:a17:906:9f26:b0:947:726e:f43a with SMTP id fy38-20020a1709069f2600b00947726ef43amr12761930ejc.23.1680542969451;
        Mon, 03 Apr 2023 10:29:29 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:29:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230403132907-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <71c1c5f86e19651585426160fc4cc15dc2da6ee6.1680533760.git.mst@redhat.com>
 <0fe1e488-a1e7-11a9-d2a2-3b8b7ee6a1c7@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <0fe1e488-a1e7-11a9-d2a2-3b8b7ee6a1c7@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v11 07/10] ccw: document ADMIN_VQ as reserved

On Mon, Apr 03, 2023 at 11:55:29AM -0400, Parav Pandit wrote:
> 
> 
> On 4/3/2023 11:03 AM, Michael S. Tsirkin wrote:
> > Adding relevant registers needs more work and it's not
> > clear what the use-case will be as currently only
> > the PCI transport is supported. But let's keep the
> > door open on this.
> > We already say it's reserved in a central place, but it
> > does not hurt to remind implementers to mask it.
> > 
> s/implementers/implementation
> 
> > Note: there are more features to add to this list.
> > Will be done later with a patch on top.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   content.tex | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index f7446bf..1213d48 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2978,6 +2978,18 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
> >   MAY also choose to verify reset completion by reading \field{device status} via
> >   CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
> > +\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio over channel I/O / Features reserved for future use}
> > +
> > +At this time, devices and drivers utilizing Virtio over channel I/O
> > +do not support the following features:
> > +\begin{itemize}
> > +
> > +\item VIRTIO_F_ADMIN_VQ
> > +
> > +\end{itemize}
> > +
> > +These features are reserved for future use.
> > +
> >   \chapter{Device Types}\label{sec:Device Types}
> >   On top of the queues, config space and feature negotiation facilities
> 
> Same nit as that of mmio.

Sorry I don't get what this refers to.

> Reviewed-by: Parav Pandit <parav@nvidia.com>


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

