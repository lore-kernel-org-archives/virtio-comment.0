Return-Path: <virtio-comment-return-7192-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E284BC3064E
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4F07D71C89
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A52298641A
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 11E709863F0; Thu, 17 Aug 2023 15:20:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AA729863FA
	for <virtio-comment@lists.oasis-open.org>; Thu, 17 Aug 2023 15:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SODg_i5IOFOEbDUBGJiYIw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692285591; x=1692890391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0PO7WX++ujGqCtbObzzIwTUsgn7NpPOIGXyiwfBSZ0=;
        b=dAClzI71jJkV71HzS0Jc26ZMCwvUYQxt2AjaDgjMQWVkcNFUrbIqsmxC7ymo6y7lcn
         33oAj2ouQJ2gad1yTJCtQnJE7LCL6CxWYbxqXFfW6LVKJNTygC7ZPkfrBo0QIghj4Hlh
         lp5qf725OUZTklFMW5Yb0xNkA85qhw2ILyJMKfWSis3cN5gJNeebEg+nePnXbo40ijaX
         PUWuWoce2EiI6eLY04je99LXDui8RpiBU6i7waZ6zwTuJ3XA2rrEQ3TAXxUJpjzLt4TR
         OJlJFugqiSb5kWhbZZKiTHE9IJlKWREHsnpa0UsBM/iUsizd9DwBRbTIL4Jw1vco0LnV
         WVsA==
X-Gm-Message-State: AOJu0Yz2NuH0PSrHjUiFaic2Ug8KrP4/GdiQUnrcXOdulb7FZpITXDN4
	7fJIRWnlq+niI7LOmDWu9GIK0R5APUjkDElSjiuW/7fjyarDpX1VLwHq6YAlaZFlCtisPaSABBA
	S+uBSPepV+db20AienqCXy2JNms0GTT9rtzc5CA83BX77d9Dp7w==
X-Received: by 2002:a25:e695:0:b0:d4d:f8f4:e409 with SMTP id d143-20020a25e695000000b00d4df8f4e409mr4798344ybh.57.1692285591781;
        Thu, 17 Aug 2023 08:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ07/0IksyjX9znZJW7zJJjx7bv4ase8Dt4YfxkAtl6q4cG5fTK6L0yQc/or1KQege1vOjJpaUIROymmRGXh4=
X-Received: by 2002:a25:e695:0:b0:d4d:f8f4:e409 with SMTP id
 d143-20020a25e695000000b00d4df8f4e409mr4798328ybh.57.1692285591532; Thu, 17
 Aug 2023 08:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230814192904.30062-1-lingshan.zhu@intel.com>
 <20230814192904.30062-5-lingshan.zhu@intel.com> <CACGkMEtkdXrTZ_=NkuPsmhUooCgKPiCiVo-nJMaDnJ5fufzGwQ@mail.gmail.com>
 <8ce92e00-39f9-3e99-96e2-5599588869e3@intel.com>
In-Reply-To: <8ce92e00-39f9-3e99-96e2-5599588869e3@intel.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 17 Aug 2023 17:19:15 +0200
Message-ID: <CAJaqyWd=hCvknO5MQ0Nu4iwxPMfjHGHNJHiwzxAaRLcgZ1HKxg@mail.gmail.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, mst@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH 4/5] virtqueue: constraints for virtqueue state

On Tue, Aug 15, 2023 at 1:30=E2=80=AFPM Zhu, Lingshan <lingshan.zhu@intel.c=
om> wrote:
>
>
>
> On 8/15/2023 8:34 AM, Jason Wang wrote:
> > On Mon, Aug 14, 2023 at 7:29=E2=80=AFPM Zhu Lingshan <lingshan.zhu@inte=
l.com> wrote:
> >> This commit specifies the constraints of the virtqueue state,
> >> and the actions should be taken by the device when SUSPEND
> >> and DRIVER_OK is set
> >>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >> ---
> >>   content.tex | 31 +++++++++++++++++++++++++++++++
> >>   1 file changed, 31 insertions(+)
> >>
> >> diff --git a/content.tex b/content.tex
> >> index 43bd5de..f6ac581 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -587,6 +587,37 @@ \subsection{\field{Used State} Field}
> >>
> >>   See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Co=
unters}.
> >>
> >> +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a =
Virtio Device / Virtqueue State}
> >> +
> >> +If VIRTIO_F_QUEUE_STATE has been negotiated, the driver MUST set SUSP=
END in \field{device status}
> >> +first before getting or setting Virtqueue State of any virtqueues.
> > I don't get why this is a must. It could be useful for debugging.
> To avoid race conditions with the device and make the device
> implementation easier
> >
> >> +
> >> +If VIRTIO_F_QUEUE_STATE has been negotiaged but VIRTIO_RING_F_PACKED =
not been negotiated,
> > typo
> yes
> >
> >> +the driver MUST NOT access \field{Used State} of any virtqueues, it s=
hould use the
> >> +used index in the used ring.
> >> +
> >> +\devicenormative{\subsection}{Virtqueue State}{Basic Facilities of a =
Virtio Device / Virtqueue State}
> >> +
> >> +If VIRTIO_F_QUEUE_STATE has been negotiated but SUSPEND is not set in=
 \field{device status},
> >> +the device MUST ignore any accesses against Virtqueue State of any vi=
rtqueues.
> > Btw, do we need to clarify the behavior of ring reset after suspending?
> I think once suspended, the device should ignore resetting a queue

Actually shadow virtqueue could benefit from the ability to change vq
properties (addresses) while the device is suspended, and then just
resume it. I've been told that ring reset is overkill for that.

But probably it is better to address it on top, with another feature flag.

> >
> >> +
> >> +When VIRTIO_F_QUEUE_STATE has been negotiated but VIRTIO_RING_F_PACKE=
D is not,
> >> +the device MUST ignore any accesses against \field{Used State}.
> >> +
> >> +If VIRTIO_F_QUEUE_STATE has been negotiaged, the device MUST reset
> >> +the Virtqueue State of every virtqueue upon a reset.
> > Need to define the meaning of "reset" this is important for packed virt=
queue.
> I will remove this as Stefan suggested.
> >
> >> +
> >> +If VIRTIO_F_QUEUE_STATE and VIRTIO_RING_F_PACKED have been negotiaged=
, when SUSPEND is set,
> >> +the device MUST record the Virtqueue State of every enabled virtqueue
> >> +in \field{Available State} and \field{Used State} respectively,
> >> +and correspondingly restore the Virtqueue State of every enabled virt=
queue
> >> +from \field{Avaiable State} and \field{Used State} when DRIVER_OK is =
set.
> > We can just let the device report those states in any case then we
> > don't need to care about those details, or did you see any blockers?
> Agree, I will add the definition of used_state of splitted vq in the
> next version
>
> Thanks
> >
> > Thanks
> >
> >> +
> >> +If VIRTIO_F_QUEUE_STATE has been negotiated but VIRTIO_RING_F_PACKED =
has been not, when SUSPEND is set,
> >> +the device MUST record the available state of every enabled virtqueue=
 in \field{Available State},
> >> +and restore the available state of every enabled virtqueue from \fiel=
d{Avaiable State}
> >> +when DRIVER_OK is set.
> >> +
> >>   \input{admin.tex}
> >>
> >>   \chapter{General Initialization And Device Operation}\label{sec:Gene=
ral Initialization And Device Operation}
> >> --
> >> 2.35.3
> >>
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

