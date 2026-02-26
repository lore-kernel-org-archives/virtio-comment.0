Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F602765ED
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 05:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772084449; cv=none; b=szN6BD1R2flbYqHRUXHB4IAH7F4BgHEDKSNZKWH8QhSHcJnKwhY+GD5VFfWUeGWM0KQoykmOZFFge57U1AQRSgJ7MNwqj/G4u7dQK2IGTZGBwsyGBg+vXKvKhZzM6KrJKsJpRelXWGQ/aAlpaEKIU5PzcW2Mwxy9ix9YVjvYkvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772084449; c=relaxed/simple;
	bh=VfHrUWk4kd7Av1zEMI8YxB02R0c/ZrF8viI8EAi8dfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1GKK359Wo2nbCwlNjvXC2CSSdzICZaND+g8PNtf1fcEzNIk64PZYHjjBGRFEGw6QgMI7DcTNBafWQTAkgULIY64Q9fDAPxzcT7vNz6JUovpAbdgeRhQSzKK4bqn4Kr1Eq0MqSyy/9HBCMrnTz821ZcSAmkI/3Aqhx5mwB+X7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOLJsvnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOLJsvnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB6BC19422;
	Thu, 26 Feb 2026 05:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772084449;
	bh=VfHrUWk4kd7Av1zEMI8YxB02R0c/ZrF8viI8EAi8dfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOLJsvnPdThk8ZgU9SISYBiedKPXFDOW5eKwwH8xoYOwWsJAl05/S9MqFYyLFxpf0
	 6AnUT/dntGv+sRdrtgJer2QSd4PgEM8OTEumDAJMkha+iuRMrPaPVnpNxIX1muWnq/
	 IdB1lcyXJRiSSvQoTjCCf66AV0+uW2UwPEF+spsGnOeSbM9QQcNtMXng/WmZdG8bzU
	 F8E8/bmQTNr0suWtlKHGQCJEfxrg/n59621n5UXdjc9LlxPhK7gnqcTAOEOpDg2/29
	 U1yCWVSDUZGlw7JyBrFYD4trJ4Df4NUR+xW9JXbx0tAuouuzJ/j1/vKcFvCoZPVd0S
	 Od8eIIsL7l1XA==
Date: Thu, 26 Feb 2026 11:10:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <fvwk5w52h2txthli74zcm3czef4ilk7fvydkle2fdof7u662gn@yhqgw4hte3oi>
References: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <SJ0PR12MB6806151DD9BF3AEF3839FB62DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>

On Wed, Feb 25, 2026 at 03:12:11PM +0000, Bertrand Marquis wrote:
> Hi Parav,
> 
> > On 25 Feb 2026, at 16:07, Parav Pandit <parav@nvidia.com> wrote:
> >
> > Hi Bertrand,
> >
> >> From: Parav Pandit <parav@nvidia.com>
> >> Sent: 25 February 2026 08:30 PM
> >
> > [..]
> >>>>>> So the PCI device is not one virtio device but one bus behind which there can be many devices.
> >>>>>>
> >>>>>> Is this making the concept a bit clearer ?
> >>>>>>
> >>>>> Yes. This makes a lot of sense now.
> >>>>>
> >>>>> This is a virtio-msg-transport device that needs its own device id in the table.
> >>>>> And its binding to the PCI transport.
> >>>>
> >>>> ok. how about an rfc of that idea on the list?
> >>>
> >>>
> >>> I will let Edgar answer on this.
> >>>
> >> Sure.
> >> Also please explain how is this different than SR-IOV devices?
> >> On a PCI device there are some child devices exposed using some virtio-msg bus transport.
> >> And all of them are going to share same PCI BDF.
> >> These individual devices cannot be mapped to different VMs (secure or regular) in a performant way either.
> >> So what would this virtio-msg-transport device achieve?
> >>
> >> If there was no PCI bus when implementing the virtio-msg transport, it would make sense to avoid trap-emulate story.
> >> But underlying transport being PCI, its back to square one for the originally described motivation.
> >
> > If the objective of the virtio-msg layer is to really support FF-A or similar other non-PCI transports, lets please focus the discussion on such use case and binding of that specific non-PCI bus. (like the link you pointed on arm site).
> >
> > This would help this series to progress faster without getting distracted on PCI side.
> 
> Agree the example of virtio-msg over PCI made the discussion divert a bit.
> 

I brought it up *only* because I felt that the bus implementations need to be
defined in the spec, because it would be hard for us to use virtio-msg without
defining the actual bus implementation. Merely defining the 'bus requirements'
is not enough.

> Maybe focusing on use cases like:
> - FF-A
> - messaging unit + shared memory
> - hypervisor based events + shared memory
> 

IMO, for the initial version, you can atleast define one bus implementation. It
could be one among the three you mentioned above. PCI bus implementation could
very well come later once this gets in.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
