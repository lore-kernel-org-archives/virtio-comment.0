Return-Path: <virtio-comment-return-7432-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1027EE6459
	for <virtio-comment@archiver.kernel.org>; Fri, 15 Sep 2023 11:16:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 388592B063
	for <virtio-comment@archiver.kernel.org>; Fri, 15 Sep 2023 11:16:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2024F986665
	for <virtio-comment@archiver.kernel.org>; Fri, 15 Sep 2023 11:16:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0E083986659; Fri, 15 Sep 2023 11:16:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F15B498665C
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Sep 2023 11:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qRsQ8zXBOSCe239e06i_kg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694776568; x=1695381368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMiGcLDXUsgh2I9plU4Gk16waQyZ+MZETGRJx6ZET40=;
        b=KNoZYJEQOTqa/GNwcg9Rk8ki1D0ci+SgXT1aJhD5h/2fItabWNCs2NSjsiOaVLzK0B
         qcgkU5/Re7bCuExfS/kNYpsACSqE+dpDyImqLl7DZFUMAdof3vlZY6F1M4wecpB9W18j
         9UE4fnh2fa7IFLMaIDVouUZX+dTOy+woRYOV+JT+RTbgzojSzOUsnlgBq2xpNeXVqsEz
         lG5Bkh58I4fP4Jp+tyz7QORXibHn+/AHcy3UglLOQG4IPaBaUCKNLYyllr0ggupBPGLJ
         zIhBDUuFrJZSO0UZhZ+7WjwGSoOkkPYBwEt7PfueDcD0+yRt99FDyVCEDcxo8ix8DNoE
         y43Q==
X-Gm-Message-State: AOJu0Yx/XlTxKr8xMk7UJVswJTTf42v4/B7YX7og43SnZAc3Nfqojys3
	z1HFRVb7ZdQFDCNhJY2DjygwFXuWozaH73xHVM8RnzzjrQ2zAYxIthGFiasvB2+KERs2KctLu08
	Il7Q0y43UXsr+N5+1Sj1zbsgjEYvATNR8pA==
X-Received: by 2002:a17:907:c27:b0:9ad:8641:e91b with SMTP id ga39-20020a1709070c2700b009ad8641e91bmr7096186ejc.11.1694776568650;
        Fri, 15 Sep 2023 04:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxtz+lBuunaIAxkQb4gR7XOJnU15d5EkkuY5Pe+JsdSrUUN5shCguMNYhgDwxDFUunXsFEdQ==
X-Received: by 2002:a17:907:c27:b0:9ad:8641:e91b with SMTP id ga39-20020a1709070c2700b009ad8641e91bmr7096156ejc.11.1694776568329;
        Fri, 15 Sep 2023 04:16:08 -0700 (PDT)
Date: Fri, 15 Sep 2023 07:16:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230915071111-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-4-lingshan.zhu@intel.com>
 <20230914072857-mutt-send-email-mst@kernel.org>
 <313a60c5-34ac-ca77-b7e1-7cb7eaf11340@intel.com>
MIME-Version: 1.0
In-Reply-To: <313a60c5-34ac-ca77-b7e1-7cb7eaf11340@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 3/5] virtqueue: constraints for virtqueue state

On Fri, Sep 15, 2023 at 10:59:29AM +0800, Zhu, Lingshan wrote:
> 
> 
> On 9/14/2023 7:30 PM, Michael S. Tsirkin wrote:
> > On Wed, Sep 06, 2023 at 04:16:35PM +0800, Zhu Lingshan wrote:
> > > This commit specifies the constraints of the virtqueue state,
> > > and the actions should be taken by the device when SUSPEND
> > > and DRIVER_OK is set
> > > 
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >   content.tex | 19 +++++++++++++++++++
> > >   1 file changed, 19 insertions(+)
> > > 
> > > diff --git a/content.tex b/content.tex
> > > index 0fab537..9d727ce 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -594,6 +594,25 @@ \subsection{\field{Used State} Field}
> > >   When VIRTIO_RING_F_PACKED is not negotiated, the 16-bit value of \field{used_idx}
> > >   is always 0
> > > +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a Virtio Device / Virtqueue State}
> > > +
> > > +If VIRTIO_F_QUEUE_STATE has been negotiated but VIRTIO_RING_F_PACKED not been negotiated,
> > > +the driver SHOULD NOT access \field{Used State} of any virtqueues, it SHOULD use the
> > > +used index in the used ring.
> > > +
> > > +\devicenormative{\subsection}{Virtqueue State}{Basic Facilities of a Virtio Device / Virtqueue State}
> > > +
> > > +If VIRTIO_F_QUEUE_STATE has been negotiated, the device SHOULD only accept setting
> > > +Virtqueue State of any virtqueues when DRIVER_OK is not set in \field{device status},
> > > +or both of DRIVER_OK and SUSPEND are set in \field{device status}.
> > > +Otherwise the device MUST ignore any writes to Virtqueue State of any virtqueues.
> > > +
> > > +If VIRTIO_F_QUEUE_STATE have been negotiated, when SUSPEND is set,
> > > +the device MUST record the Virtqueue State of every enabled virtqueue
> > > +in \field{Available State} and \field{Used State} respectively,
> > record how?
> This is transport specific, for PCI they are recorded in the common config
> space,
> two new fields of them are introduced in patch 5.


that is not enough space to record state for every enabled vq.

> > 
> > > +and correspondingly restore the Virtqueue State of every enabled virtqueue
> > > +from \field{Available State} and \field{Used State} when DRIVER_OK is set.
> > when is that?
> When the DRIVER sets DRIVER_OK and done before the device presents
> DRIVER_OK.

I don't really understand the flow here. does SUSPEND clear DRIVER_OK
then?


> > 
> > 
> > > +
> > >   \input{admin.tex}
> > >   \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
> > > -- 
> > > 2.35.3


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

