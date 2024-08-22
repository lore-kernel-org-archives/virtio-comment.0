Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89B917CA0A
	for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319023; cv=none; b=rhZD5tfJUD76kxudya+HuJm2KFom/wUAohCD1bnpDlD6qIf6i3Xasz8mtlrvC4wils7gJEIu8l0lAlfY7Tdk+EUum5KGa6xoGV2ryKgc6PKaZuQUyUbGXE3VqLj2fkb/HTW9oSMBI71zOmmQI48gTVRhdKY7JH7clKlFbKH1KBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319023; c=relaxed/simple;
	bh=WqKIQ69dXJdi3Ipdl+0Zw3fM4QsFo13CvAfQMwIpEQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iStKJPloQlgj/odpGK92VPVJTJZtMpGPu8WRGS8avntyQ3+b9pHWZrFNWMzWQs3ZvkVnUw8f5z44gdmcjezjjP5Vv5yhgdI4rsJoraLyZPthwg5GwoovBYh47e6tPJQH+GWx8xDp7/mOHvgs2wJiIhKjjKB8MnNo4MzmtK2T1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1sh492-0005F6-0c; Thu, 22 Aug 2024 11:30:16 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
  "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH RESEND 3/4] virtio-net: support transmit ptp timestamps
In-Reply-To: <PH0PR12MB5481F37A4C9B035F2E556F20DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
	(Parav Pandit's message of "Tue, 25 Jun 2024 05:25:55 +0000")
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
	<20240624-v1-4-topic-virtio-net-timestamping-v1-3-fa3c163e4aa9@pengutronix.de>
	<PH0PR12MB5481F37A4C9B035F2E556F20DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Date: Thu, 22 Aug 2024 11:30:14 +0200
Message-ID: <87wmk89a6x.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev


Hi,

On 2024-06-25 at 05:25 GMT, Parav Pandit <parav@nvidia.com> wrote:

> Hi Steffen,
> 
> > From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > Sent: Monday, June 24, 2024 4:39 PM
> > To: virtio-comment@lists.linux.dev; kernel@pengutronix.de
> > Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > Subject: [PATCH RESEND 3/4] virtio-net: support transmit ptp timestamps
> > 
> > Add optional PTP hardware tx timestamp offload for virtio-net.
> > 
> Very good initiate. Thanks for bringing timestamping to virtio.
> 
> > Accurate RTT measurement requires timestamps close to the wire.
> > Introduce virtio feature VIRTIO_NET_F_TX_TSTAMP, the transmit equivalent
> > to VIRTIO_NET_F_RX_TSTAMP.
> > 
> > The driver sets VIRTIO_NET_HDR_F_TSTAMP to request a timestamp
> > returned on completion. If the feature is negotiated, the device either places
> > the timestamp or clears the feature bit.
> > 
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  device-types/net/description.tex | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex
> > index 09d9c28..c438b0b 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > Set MAC address through control
> >      channel.
> > 
> > +\item[VIRTIO_NET_F_TX_TSTAMP(47)] Device sends TAI transmit time
> > +
> The feature bit is not helpful.
> The reason is, the user needs to enable timestamp much later using ethtool (Linux) SIOCSHWTSTAMP.
> And it is desired to not reset the full device when changing this feature.
> 
> And when the feature is offered, it is also not desire to always performing timestamping as it has trade-offs.
> 
> Therefore, enablement of this functionality should be done using capabilities or other means dynamically.
> Dynamic means = without re-initializing the device and features.

okay, I understand that.

> 
> >  \item[VIRTIO_NET_F_RX_TSTAMP(48)] Device sends TAI receive time
> > 
> >  \item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report @@ -532,6
> > +534,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types /
> > Network Device / De  \item The header and packet are added as one output
> > descriptor to the
> >    transmitq, and the device is notified of the new entry
> >    (see \ref{sec:Device Types / Network Device / Device
> > Initialization}~\nameref{sec:Device Types / Network Device / Device
> > Initialization}).
> > +
> > +\item If the driver negotiated the VIRTIO_NET_F_TX_TSTAMP and hardware
> > +  timestamping is supported on the device, the
> > VIRTIO_NET_HDR_F_TSTAMP
> > +  flag is set. One writable input descriptor with the size of a
> > +timestamp,
> > +  i.e. \field{tstamp} in virtio_net_hdr_hash_ts,
> > +  is appended to the output descriptor.
> >  \end{enumerate}
> > 
> This does not work any effectively for following reasons.
> 1. a TS is 8B, it is pointless to pass another 16B descriptor for 8B of data. This is 200% overhead.
> 2. a TS write of 8B also creates a cache line bounding due to partial writes even in modern cpus
> 3. Apart from the short write, because it is a dedicated address, the DMA cannot be merged by the device for it with something else.
> 
> In short, a dedicated descriptor for TS timestamp or including this TS in vnet_hdr is not good idea.

And this sounds reasonable, too. Understood.
> 
> Many of us already discuss the new descriptor format that solves many of these issues.
> i.e. to have a transmit completion which contains all needed fields including TS that also overcomes above 3 issues.
> 
> We captured these requirements at [1]. Please refer to 3.5.1 point 3.
> It would be good if you can extend the descriptors this way that can work for hw.
> 
> [1] https://lore.kernel.org/virtio-comment/20230818043557.496964-7-parav@nvidia.com/
> 

Here I'm a little bit confused. So you want me to describe the feature in terms of the vnet_rx_completion or vnet_tx_completion that is, which is not described yet? For the spec part this seems "easy" but the actual implementation sounds a "little bit" more involved.

Do you know, if there are already patches floating around for virtio-net that implement this new specification. I'd like to test it in code before writing the documentation/spec. 


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
