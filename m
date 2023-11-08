Return-Path: <virtio-comment-return-8272-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BEEC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:55:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3FC422A8FA
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:55:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27041986CB3
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:55:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 10BEE986CAA; Wed,  8 Nov 2023 17:55:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0046F986CAB
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 17:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WF1fADvqPq-J8ZXOiZOPTQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699466106; x=1700070906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5X5h2//TU2RIg+BlaD+MjcCe5NibvlpilT3M5MMIYw=;
        b=MQHPz+gFYQxrYAwe9+aGgl/fi+//WP8C/Ot2Bgv2IZMzp8xgDDu9LPsgm4Brq+ouso
         mGv2WMXHpnaArGjBBvwJIDFKare6gFh9JY13mtxwirUz4pAj2M+fkA+9tO3sWVckA9EX
         LZVpw427YF6QvzabPD9hSinYajZT5XcH+Bv2dUwBWetKGUew1SnIxHjDv3YWUuSRbHqM
         iPdm9eP1D7KNdDuoyLbJBTKs5B9psdy4fau4a42wW01Oa5/4s5mQH2bRLu/GlfxcLdKv
         T8/Ne1/SLO8ov12mzpJ+5kNwvRsRA7J8B6BEmK7jSBnM1a/u14SNFnOpqYREZLaUHg7u
         j9wA==
X-Gm-Message-State: AOJu0YzwQMvwO/RcsMAWTkyr5auaz58yjLUnGjlcdYkyp1mB7/JFq9ut
	PsKsCSgatQUamze2aF4QA50vlZAshtl9SAhJWciWHEJWIDGrBEkqFQ8CzgNYKEebl00Qg7+5RRk
	G3Pd8PW94VJ0dhWdBXxhdc/oOLgyVf43XMy9eqWPYCg==
X-Received: by 2002:a05:600c:1988:b0:401:c338:ab94 with SMTP id t8-20020a05600c198800b00401c338ab94mr2497287wmq.29.1699466105901;
        Wed, 08 Nov 2023 09:55:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESXyd+Gjo3y4/n+ryPqFzQlxtD2aDZPwC9RjyRKwdgbGOJP7fB0uk+dXyqB4X9zdT2oK/shA==
X-Received: by 2002:a05:600c:1988:b0:401:c338:ab94 with SMTP id t8-20020a05600c198800b00401c338ab94mr2497261wmq.29.1699466105397;
        Wed, 08 Nov 2023 09:55:05 -0800 (PST)
Date: Wed, 8 Nov 2023 12:55:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231108124844-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <20231106043648-mutt-send-email-mst@kernel.org>
 <bfa59a74-76b9-48d1-84e1-90e42a3e5bdf@intel.com>
MIME-Version: 1.0
In-Reply-To: <bfa59a74-76b9-48d1-84e1-90e42a3e5bdf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH V2 2/6] virtio: introduce SUSPEND
 bit in device status

On Tue, Nov 07, 2023 at 05:09:06PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 5:43 PM, Michael S. Tsirkin wrote:
> 
>     On Fri, Nov 03, 2023 at 06:34:33PM +0800, Zhu Lingshan wrote:
> 
>         This patch introduces a new status bit in the device status: SUSPEND.
> 
>         This SUSPEND bit can be used by the driver to suspend a device,
>         in order to stabilize the device states and virtqueue states.
> 
>         Its main use case is live migration.
> 
>         Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>         Signed-off-by: Jason Wang <jasowang@redhat.com>
>         Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>         ---
>          content.tex | 36 ++++++++++++++++++++++++++++++++++--
>          1 file changed, 34 insertions(+), 2 deletions(-)
> 
>         diff --git a/content.tex b/content.tex
>         index 76813b5..bcc9d4b 100644
>         --- a/content.tex
>         +++ b/content.tex
>         @@ -49,6 +49,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
> 
>          \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>            an error from which it can't recover.
>         +
>         +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
>         +  device has been suspended by the driver.
>         +
> 
>     what does this mean?
> 
> When the driver sets SUSPEND and the device presents SUSPEND, means
> the device has been suspended by the driver.
> 
> Do you suggest to remove "When VIRTIO_F_SUSPEND is negotiated"
> 


No I suggest explaining what does it mean that device has been
suspended.

> 
>          \end{description}
> 
>          The \field{device status} field starts out as 0, and is reinitialized to 0 by
>         @@ -73,6 +77,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>          recover by issuing a reset.
>          \end{note}
> 
>         +The driver SHOULD NOT set SUSPEND if FEATURES_OK is not set.
>         +
>         +When setting SUSPEND, the driver MUST re-read \field{device status} to ensure the SUSPEND bit is set.
>         +
> 
>     and if it's not?
> 
> Then the device may run into errors or just need longer time to suspend.

and then what does driver do?

> This is how we handle features_OK: "Re-read device status to ensure the
> FEATURES_OK bit is still set"

this is designed in case features are inconsistent.
what kind of thing are you handling here?
Also and then we bail out and retry with other feature set if not.
what do we do here?

> 
> 
>          \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
> 
>          The device MUST NOT consume buffers or send any used buffer
>         @@ -82,6 +90,26 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>          that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
>          MUST send a device configuration change notification to the driver.
> 
>         +The device MUST ignore SUSPEND if FEATURES_OK is not set.
>         +
>         +The device MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
>         +
>         +The device SHOULD allow settings to \field{device status} even when SUSPEND is set.
> 
>     which settings?
> 
> any legit writing to the device status, like DRIVER_OK
> 

that's not "settings" that's setting.

> 
>         +
>         +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device SHOULD clear SUSPEND
>         +and resumes operation upon DRIVER_OK.
>         +
>         +If VIRTIO_F_SUSPEND is negotiated, when the driver sets SUSPEND,
>         +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
>         +
>         +\begin{itemize}
>         +\item Stop consuming buffers of any virtqueues and mark all finished descritors as used.
> 
>     descritors? and what does finished mean?
> 
> Sorry my typo.
> 
> Finished means done processing it.
> 
> Like the spec words: When the device has finished a buffer, it writes the
> descriptor index into the used ring, and sends a used buffer notification.
>

only good for internal ring documentation - we did not want to say
used because it's not used until used entry written.
here just say used.

> 
> 
>         +\item Wait until all descriptors that being processed to finish and mark them as used.
> 
>     descriptors are not marked used. buffers are.
> 
>     that being -> that are being maybe?
> 
> Will fix
> 
> 
> 
>         +\item Flush all used buffer and send used buffer notifications to the driver.
> 
>     used buffers?
> 
> Here it means the buffer marked as used.
> shall I use finished buffer or any other suggestions?
> 
>     what does Flush mean?
> 
> Flush means send all of them out. Like 5.19.7.1 Device Requirements: Device
> Operation: Virtqueue flush
> 
> 
> 
> 
>         +\item Record Virtqueue State of each enabled virtqueue, see section \ref{sec:Virtqueues / Virtqueue State}
> 
>     execpt that one unfortunately does not bother to say what does this mean
>     :(
> 
> The virtqueue state has been defined in this series, in packed/split-ring.tex.
> And an PCI implementation of the interfaces is included.
> 
> Do you suggest any supplementary materials?
> 

I suggest something that documents what it means unlike what is
in this series.


> 
>         +\item Pause its operation except \field{device status} and preserve configurations in its Device Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
> 
>     How do you Pause? For example, consider a link state register. You set
> 
> The device pauses itself.
> 
>     SUSPEND, then link goes down. What is device supposed to do?
> 
> Once the device suspended, the device should not respond to the link_down
> until alive again.

what is link_down?
link goes down just by virtue of disconnecting it physically.

> This is to preserve the device states, just record
> whatever it is when SUSPEND-ed. And process the signal when resume or
> alive at the destination side. At the destination it also needs a
> live announce which require an active link.
> 
>     Record this somewhere internal but do not show it to driver?
>     And how exactly will this hidden internal state be migrated
>     since it is not visible?
> 
> May I know what kind of internal states?
> This series migrates stateless devices, hard to define virtio-fs device
> context.
> 

all devices have some state, none are completely stateless.


> 
> 
>         +\end{itemize}
>         +
>          \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}
> 
>          Each virtio device offers all the features it understands.  During
>         @@ -99,10 +127,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>          \begin{description}
>          \item[0 to 23, and 50 to 127] Feature bits for the specific device type
> 
>         -\item[24 to 42] Feature bits reserved for extensions to the queue and
>         +\item[24 to 43] Feature bits reserved for extensions to the queue and
>            feature negotiation mechanisms
> 
>         -\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>         +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
>          \end{description}
> 
>          \begin{note}
>         @@ -875,6 +903,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>            \item[VIRTIO_F_QUEUE_STATE(42)] This feature indicates that the device allows the driver
>            to access its internal virtqueue state.
> 
>         +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>         +   SUSPEND the device.
> 
>     why is SUSPEND upper-case here?
> 
> will be lower in V3.
> 
> Thanks
> 
> 
> 
>         +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>         +
>          \end{description}
> 
>          \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>         --
>         2.35.3
> 
> 
>     This publicly archived list offers a means to provide input to the
>     OASIS Virtual I/O Device (VIRTIO) TC.
> 
>     In order to verify user consent to the Feedback License terms and
>     to minimize spam in the list archive, subscription is required
>     before posting.
> 
>     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     List help: virtio-comment-help@lists.oasis-open.org
>     List archive: https://lists.oasis-open.org/archives/virtio-comment/
>     Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>     List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>     Committee: https://www.oasis-open.org/committees/virtio/
>     Join OASIS: https://www.oasis-open.org/join/
> 
> 
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

