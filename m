Return-Path: <virtio-comment-return-5589-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97119C77B78
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:39:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EE5D94257B
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:39:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E0BDC98663C
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:39:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D75F0986350; Mon, 24 Apr 2023 15:39:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7AC0986411
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 15:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3KaeWpiaMtiSKTAS8DkmhA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682350741; x=1684942741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWS3qSI7eVMIpKy0NmhWGGObiBny9ReEUW+3UVDmi6s=;
        b=JxR60RtC/q71VpZ45Twazt/+iHFodHE4rqiT1r3WdZDdDaLMmAo00uzIZ2UFySqsrQ
         vD3QDejX0YiRZOEC9uCVnlcIEFkzdtdNS1VpV0hESKI+ariOFtlMsLOjaBQ2uMbBM7Lv
         S9l1yH4LykiGa1r73obyLGU0pE+dgpR09KFIytqqwkdf2dw9ckUdCxdYK+WHs+MzEMwl
         9BzOJAdyPQWp1/A8q+JIIY3ctCEfUvPv4W/LM9yRddH0bFBSEG6NsEUsucQsZ9q0uFfw
         poiJr2qGIwjOBn26evmzuFyEm9RhobP8SiFWU8I8jeG33878XQxpahfgQif8KmUK/B1k
         Rz1w==
X-Gm-Message-State: AAQBX9dyLqetaBGM6IQNP8h3EH4zv73hWEjmjy+sx5/P7CM4EDm3tfRv
	7mGd+ZfmaMMpvMqpqZSX91oRva0vgUr0dLtXk3JgubTzf0WjFCrJj9D8DaqWF4R2TBiqevbTmpz
	BWAjXHOIaQSWWU+8pEkoxyqMvoEyGn8SQmA==
X-Received: by 2002:a05:600c:2183:b0:3f1:8372:d575 with SMTP id e3-20020a05600c218300b003f18372d575mr8027309wme.38.1682350741362;
        Mon, 24 Apr 2023 08:39:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350bT2fNPNJVil4i5vxlqWYTmg/4L7zfYIoWzfZckqHIufOzMyt+pQDNO+8JVBJPwxmfGvbm0nQ==
X-Received: by 2002:a05:600c:2183:b0:3f1:8372:d575 with SMTP id e3-20020a05600c218300b003f18372d575mr8027282wme.38.1682350741029;
        Mon, 24 Apr 2023 08:39:01 -0700 (PDT)
Date: Mon, 24 Apr 2023 11:38:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230424113729-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <aa6e3f39c4db34f3cf50a650cffeb0180d89e616.1680533760.git.mst@redhat.com>
 <8f9df843-247c-df96-bae5-4e4c2b2d1e8e@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <8f9df843-247c-df96-bae5-4e4c2b2d1e8e@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v11 06/10] mmio: document ADMIN_VQ
 as reserved

On Mon, Apr 03, 2023 at 11:54:04AM -0400, Parav Pandit wrote:
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
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Parav Pandit <parav@nvidia.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   content.tex | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index 5057df2..f7446bf 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2364,6 +2364,18 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
> >   Notification mechanisms did not change.
> > +\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio Over MMIO / Features reserved for future use}
> > +
> > +At this time, devices and drivers utilizing Virtio Over MMIO
> No need to mention, "At this time".
> It is always spec version to version.
> And "current time" of the spec is visible in its version.
> Please remove "At this time".
> 
> > +do not support the following features:
> > +\begin{itemize}
> > +
> > +\item VIRTIO_F_ADMIN_VQ
> > +
> > +\end{itemize}
> > +
> > +These features are reserved for future use.
> > +
> Above line should be moved up before listing the features.
> or should be written as
> s/These/Above
> 
> like, Above listed features are reserved for future use.

I don't feel it matters. And
we were asked to reduce the use of "below" and "above" in new text
as disrespectful to people using screen readers and such.

> >   \section{Virtio Over Channel I/O}\label{sec:Virtio Transport Options / Virtio Over Channel I/O}
> >   S/390 based virtual machines support neither PCI nor MMIO, so a
> 
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 


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

