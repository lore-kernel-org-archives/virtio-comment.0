Return-Path: <virtio-comment-return-5420-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B78C7619A
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:43:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A4F6D6E6C5
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:43:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9AD459865F7
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:43:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 93E639865B2; Wed, 12 Apr 2023 04:43:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 797F3986509
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 04:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: blM66QuFNLuOlkmUwNjuIw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681274591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut/Bmwima0EDhYkIaQiM7S4tVfOQRbd4f+0GvW2oy6A=;
        b=Kz8pThVyp9WTFWcxHvlEGcG7Ymn27hKWOy0AZSnkIxtk2DB9PSooUWhQtdrTLotLwN
         H+HmXRXvNivi/EZOHcIgglYQ+ZRNLviy5Hwb6Wl+L8/yqi0hu5wXq1KCIvodDbKww8GT
         s0scctNUo9Z2ZVDOOsh03lppa1Y0i/pLPtN+iuMcFxRIAHx9MecXahHv8xOOdkngSufG
         5yG5aLmL4wdb4i9Wt6mf1m2ciDxalEYXF2Y4ABcqKtEMTrH0xe7jEXrf8+Wfxg9spME7
         NmT0lT9j7VgmJCu3xEO8JETB+CCFQNrOPlEG/Xc4qbCojLXy7CWV7vESdMiF2i1igqL0
         4tiQ==
X-Gm-Message-State: AAQBX9fB3BljJw7B028fQLWWgKJDItJMB5GKBKMCLzHhxIlKUazVGBdT
	W3f6uiy0khCpgGsOa2G771Qo78B+SiMMLVecWoGD6Uayjm92d8KSgwOUBxm4+v69tbB5Zi9hQVu
	KarYKLhkw/2piiDbu6e+XH8pZInPVvqaZmw==
X-Received: by 2002:a1c:f705:0:b0:3f0:4e04:b8f8 with SMTP id v5-20020a1cf705000000b003f04e04b8f8mr11185224wmh.39.1681274591543;
        Tue, 11 Apr 2023 21:43:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350buUvYrnrMR7t8R02P058kAVs5SFjJha/qkBvEkNVrmh6VD3XOSWcrX4pqPXH0s0EHFXdeM1Q==
X-Received: by 2002:a1c:f705:0:b0:3f0:4e04:b8f8 with SMTP id v5-20020a1cf705000000b003f04e04b8f8mr11185215wmh.39.1681274591263;
        Tue, 11 Apr 2023 21:43:11 -0700 (PDT)
Date: Wed, 12 Apr 2023 00:43:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230412004152-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-11-parav@nvidia.com>
 <20230412003006-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481394D07C5CFBB2347B5F0DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481394D07C5CFBB2347B5F0DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 10/11] transport-pci: Use driver notification PCI
 capability

On Wed, Apr 12, 2023 at 04:37:05AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, April 12, 2023 12:31 AM
> > 
> > On Fri, Mar 31, 2023 at 01:58:33AM +0300, Parav Pandit wrote:
> > > PCI devices support memory BAR regions for performant driver
> > > notifications using the notification capability.
> > > Enable transitional MMR devices to use it in simpler manner.
> > >
> > > Co-developed-by: Satananda Burla <sburla@marvell.com>
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  transport-pci.tex | 28 ++++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> > > diff --git a/transport-pci.tex b/transport-pci.tex index
> > > 55a6aa0..4fd9898 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -763,6 +763,34 @@ \subsubsection{Notification structure
> > > layout}\label{sec:Virtio Transport Options  cap.length >=
> > > queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
> > >
> > > +\paragraph{Transitional MMR Interface: A note on Notification
> > > +Capability} \label{sec:Virtio Transport Options / Virtio Over PCI Bus
> > > +/ Virtio Structure PCI Capabilities / Notification capability /
> > > +Transitional MMR Interface}
> > > +
> > > +The transitional MMR device benefits from receiving driver
> > > +notifications at the Queue Notification address offered using the
> > > +notification capability, rather than via the memory mapped legacy
> > > +QueueNotify configuration register.
> > > +
> > > +Transitional MMR device uses same Queue Notification address within a
> > > +BAR for all virtqueues:
> > > +\begin{lstlisting}
> > > +cap.offset
> > > +\end{lstlisting}
> > > +
> > > +The transitional MMR device MUST support Queue Notification address
> > > +within a BAR for all virtqueues at:
> > > +\begin{lstlisting}
> > > +cap.offset
> > > +\end{lstlisting}
> > > +
> > > +The transitional MMR driver that wants to use driver notifications
> > > +offered using notification capability MUST use same Queue
> > > +Notification address within a BAR for all virtqueues at:
> > > +
> > > +\begin{lstlisting}
> > > +cap.offset
> > > +\end{lstlisting}
> > > +
> > Why? What exactly is going on here? legacy drivers will not do this.
> 
> Legacy driver does in the q notify register that was sandwitched in between of slow configuration registers.
> This is the notification offset for the hypervisor driver to perform the notification on behalf of the guest driver so that the acceleration available for the non-transitional device can be utilized here as well.

I don't get it. What acceleration? for guests you need a separate page
so card can be mapped directly while config causes an exit. But
hypervisor can access any register without vmexits.

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

