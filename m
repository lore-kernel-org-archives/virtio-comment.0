Return-Path: <virtio-comment-return-7808-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2345CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:28:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 06F321922E5
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:28:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E69DC9868A2
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:28:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D4A27986898; Wed, 18 Oct 2023 10:28:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C5840986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bpbt3cKPPjmN4UsWgPUAmw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624906; x=1698229706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqogKjBHZFN6JkTDCmPrdyl405WrlTHTz9JFgYF3iGA=;
        b=YekC1rFGBrpOKrz3UUGz0jTcMBIowYuRbGhNxjkFANZ+Je/LpZomgdzZ50057goUV+
         JaNvCfrICQQFGgqEJ8DBKDuC4M8H8zDqCrVSExx0DRbk1mLbcbtLIh34yDTd1r9IcEF3
         umFm2drkMIlD4i1syc9IqYnoJm1KUEorMiWvCm2EnRxLTQvSrr8ibXuqAwzmMKo/VnNd
         dpbTScPESvHuIYCNrNq6zL5ZRjzHTtn4rXNlZiEuQk91b29tbRxyhak2U2LMh501sFlQ
         xu3G9GedkEW+LFX2m67nKK0axkipyuT1NNXUgTuxhvE6zFICKsnn+yZrQs/tFGTuuRFu
         bhCw==
X-Gm-Message-State: AOJu0YzpRaz5cdKrB6QMn0KA3OPlIDBRXvy/bvAA95K2zA+DJmgFt278
	ugzaQCBqHOZv4zw+4sT8ooI+MbFclElQ+Zq0ige00trfZpptGXybpk+MBVZj8zdCD1+/oq+TdQI
	8aj/vW0AJ+sR/gZJqQEcJpvx8k1CT2Cbn5g==
X-Received: by 2002:a50:8a9b:0:b0:53b:b110:1bd4 with SMTP id j27-20020a508a9b000000b0053bb1101bd4mr3602950edj.6.1697624906625;
        Wed, 18 Oct 2023 03:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPGp2t4pFAWmm2GmFiySWvWs1j9Cfn7GHe+T1LjEroTA7IkbarLFizz4iv70oSIEfXS1itug==
X-Received: by 2002:a50:8a9b:0:b0:53b:b110:1bd4 with SMTP id j27-20020a508a9b000000b0053bb1101bd4mr3602943edj.6.1697624906225;
        Wed, 18 Oct 2023 03:28:26 -0700 (PDT)
Date: Wed, 18 Oct 2023 06:28:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231018062704-mutt-send-email-mst@kernel.org>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com>
 <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87sf68cjn0.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Wed, Oct 18, 2023 at 12:25:23PM +0200, Cornelia Huck wrote:
> On Tue, Oct 17 2023, Parav Pandit <parav@nvidia.com> wrote:
> 
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Tuesday, October 17, 2023 5:55 PM
> >> 
> >> On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:
> >> > @@ -440,6 +440,38 @@ \subsubsection{Virtqueue
> >> > Re-enable}\label{sec:Basic Facilities of a Virtio Devic  as during
> >> > initial virtqueue discovery, but optionally with different  parameters.
> >> >
> >> > +\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a
> >> > +Virtio Device / Virtqueues / Dynamic Virtqueues}
> >> > +
> >> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the
> >> > +virtqueues during the device initialization sequence, i.e. after the
> >> > +device sets the FEATURES_OK status bit and before the driver setting the
> >> DRIVER_OK status bit.
> >> 
> >> _Or_ if a virtqueue has been reset and the driver wants to re-enable it, right?
> >> 
> > Well no. Because above text is for "enablement", and not re-enablement.
> > If the driver want to reset and re-enable, it must be enabled in first place before setting driver_ok.
> > VQ not enabled before driver ok, cannot be reset, and hence cannot be re-enabled.
> >
> > So I think above text is fine because it says about "enables" and not "re-enables".
> >
> >> > +
> >> > +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid
> >> > +enabling the virtqueues before setting the DRIVER_OK status bit; the
> >> > +driver can enable the specific virtqueues after the driver has set the
> >> DRIVER_OK status bit.
> >> 
> >> "the driver is not required to enable every virtqueue it wants to use before
> >> setting the DRIVER_OK status bit; it can choose to enable a virtqueue even after
> >> it has set the DRIVER_OK status bit."
> >> 
> > Sounds good. Will change it.
> >
> >> > +The virtqueue enable mechanism is transport specific.
> >> 
> >> Would that be the same mechanism as for re-enabling a queue after a queue
> >> reset? I guess I'm missing the relationship here...
> >> 
> > Yes, it is same.
> > There is no change in enabling/re-enabling the virtqueue after/before DRIVER_OK with/without _dynamic bit.
> > So no extra text added here.
> 
> This is not really clear to me just from this text, especially if you
> just wrote above that enabling or re-enabling is something
> different... my understanding would be:
> 
> - if neither dynamic vqs nor queue reset are supported or negotiated,
>   the only way to enable a vq is before DRIVER_OK, during setup
> - both of these features rely on the transport supporting enabling
>   individual queues (either a queue that has not been enabled before, or
>   a queue that has been reset)
> - the transport is supposed to use the same mechanism for either
> 
> Did I get it right? If so, I think we should make it a bit more clear.
> 
> (...)
> 
> >> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST enable
> >> > +the required number of virtqueues before setting the DRIVER_OK status bit.
> >> 
> >> What does "required" mean here? It just chooses to enable the queues it wants
> >> to use, right?
> > Right.
> > Required meaning, whatever number of queues that driver choose to enable, those must be enabled before driver_ok.
> > So it is "required by the driver".
> > Would that be ok?
> 
> I'd write it as "the driver MUST enable any virtqueue it plans to use"
> or something like that.
> 
> (...)

It would have to be SHOULD - we can't add new MUST requirements not
contingent on a feature bit, we can give recommendation based on
existing installed base.

> >> We currently have a device normative statement:
> >> 
> >> "The device MUST NOT consume buffers or send any used buffer notifications to
> >> the driver before DRIVER_OK."
> >> 
> >> I guess we need to extend that to not doing that for not-yet-enabled queues in
> >> the dynamic virtqueue case? There's a (transport-specific) point in time when
> >> the driver tells the device that the queue is ready, right?
> >
> > We don’t need extend this text because device does not know anything about the disabled queue, so it cannot consume any buffer from it anyway.
> > Above line only applied to the enabled virtqueue.
> 
> My point is: DRIVER_OK signals that the driver is done with its setup
> and the device may start to interact with the queue. Depending on the
> mechanism the transport uses for enabling the queue, it may "know" about
> the queue before the driver is ready -- it might need to wait until the
> driver has completed enabling of the queue. Not sure if that is worth
> spelling out.


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

