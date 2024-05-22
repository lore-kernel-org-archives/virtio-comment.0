Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B604C6D
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 02:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716345618; cv=none; b=DbqYjtGyZOFu7xd2qOIJtPV94KSJct3DFDMNvkUKjvBpCxk+n8FMrkcDR5IgaB0z5ES6oK/mBwSyHIIgH3jflgZgpkbbrpnSEx6JkUMcK8yCw62kJfsfXXgPUCUlwLFS3oHFy0lQET+2PNReHeI6+lc08wDCpxcRbuY0jsaf978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716345618; c=relaxed/simple;
	bh=t7w41bCCGK2ZRt9bp4IA3TbNFuqn1HzJ3lxXefIC9ws=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To:
	 Content-Type; b=mHJJML2mlKxQBCCaXPzceONfaLi5b27l1m6FdwB4z27L7vt0whleJks3Io42XYInmnC9j5bzsJor+wn0veftDUNEASByFriBWMonkRthuOTJ+d1YjRC8nT+410SOjbquXEHhfhYrHlogryaxnc3mY+Iy6tnIyYrRPVNYSekS+JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AZ5oV+eI; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AZ5oV+eI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716345612; h=Message-ID:Subject:Date:From:To:Content-Type;
	bh=CMep1giZvpXO6QyyUwgdEEt+ToHY3DUyDoYpZXQsqY8=;
	b=AZ5oV+eIF8t0C2C+/sY5Kf/MX3s6szNjOSitA6vt5ot6fYkBnGjqrAUg0yH7ZPdBJhz10JcePR1c5z1j/1mE4xCbp2NPx8fMu4+F9vzta7F4mWkEeTgYfbbtJHGN6gx6d6+RoySNcadvZ75h6TGhWyrZ/O/cdZtZ7kB9FNOXUxQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0W6zbpAX_1716345610;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W6zbpAX_1716345610)
          by smtp.aliyun-inc.com;
          Wed, 22 May 2024 10:40:11 +0800
Message-ID: <1716343906.6530488-1-hengqi@linux.alibaba.com>
Subject: Re: RE: RE: RE: RE: RE: [PATCH v2] virtio-net: improve description of default coalescing parameters
Date: Wed, 22 May 2024 10:11:46 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Jason Wang <jasowang@redhat.com>,
 "Michael   S .   Tsirkin" <mst@redhat.com>
References: <20240513125634.102955-1-hengqi@linux.alibaba.com>
 <PH0PR12MB54815E887B1010D2AE96CEACDCE32@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1715665954.5198457-1-hengqi@linux.alibaba.com>
 <PH0PR12MB5481EAD646ECB0CBF979FFC7DCE32@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1715673206.4680686-3-hengqi@linux.alibaba.com>
 <PH0PR12MB5481CAFB5B39638566238063DCE32@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1716258261.2936878-1-hengqi@linux.alibaba.com>
 <PH0PR12MB548164BEB956FA8EA516C5E8DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1716285826.606679-2-hengqi@linux.alibaba.com>
 <PH0PR12MB5481AC22EC51E2FF94B25EBEDCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481AC22EC51E2FF94B25EBEDCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Tue, 21 May 2024 13:55:19 +0000, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Tuesday, May 21, 2024 3:34 PM
> >=20
> > On Tue, 21 May 2024 06:02:15 +0000, Parav Pandit <parav@nvidia.com>
> > wrote:
> > >
> > >
> > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > Sent: Tuesday, May 21, 2024 7:54 AM
> > > > On Tue, 14 May 2024 13:09:32 +0000, Parav Pandit <parav@nvidia.com>
> > > > wrote:
> > > > >
> > > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > Sent: Tuesday, May 14, 2024 1:23 PM
> > > > > >
> > > > > > On Tue, 14 May 2024 07:48:55 +0000, Parav Pandit
> > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > Sent: Tuesday, May 14, 2024 11:23 AM
> > > > > > > >
> > > > > > > > On Tue, 14 May 2024 03:59:52 +0000, Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > > > > > wrote:
> > > > > > > > > Hi Heng,
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > Sent: Monday, May 13, 2024 6:27 PM
> > > > > > > > > >
> > > > > > > > > > Currently, a device may initialize each vq's coalescing
> > > > > > > > > > parameters to empirically non-zero values, so the
> > > > > > > > > > description of this part is supplemented for the virtio=
 spec.
> > > > > > > > > >
> > > > > > > > > Currently the spec says to initialize the vq's coalescing
> > > > > > > > > parameters to
> > > > zero.
> > > > > > > > >
> > > > > > > > > Spec snippet: " Upon reset, a device MUST initialize all
> > > > > > > > > coalescing
> > > > > > > > parameters to 0."
> > > > > > > > >
> > > > > > > > > So I didn't understand why you say "current the device may
> > > > initialize".
> > > > > > > > >
> > > > > > > > > Do you mean, you want to change the spec to say, by
> > > > > > > > > default the device has
> > > > > > > > chosen to set zero or non-zero default parameter as it like=
s.
> > > > > > > > > (and not zero).
> > > > > > > >
> > > > > > > > Yes.
> > > > > > > >
> > > > > > > > If a device supports interrupt coalescing moderation, it
> > > > > > > > usually has a non- zero default value to provide better per=
formance.
> > > > > > > When VIRTIO_NET_F_VQ_NOTF_COAL or VIRTIO_NET_F_NOTF_COAL
> > is
> > > > not
> > > > > > negotiated, the device can apply any notification coalescing va=
lue.
> > > > > > > (assuming EVENT_IDX is off).
> > > > > > >
> > > > > > > But when they above features are negotiated, it is expected
> > > > > > > that driver is going to driver it,
> > > > > >
> > > > > > The driver drives the runtime parameters without conflicting
> > > > > > with the initial default values.
> > > > > > And most users/drivers without dim enable may not drive it.
> > > > > >
> > > > > There is no conflict in runtime or default parameters.
> > > > > For driver it starts after 10msec or 4 minutes, both are runtime
> > parameters.
> > > > >
> > > > > > The device need to be defensive about default performance.
> > > > > >
> > > > > The device can surely offer the default performance with non zero
> > > > > default
> > > > values.
> > > >
> > > > That's what I'm mentioning.
> > > >
> > > > >
> > > > > > >in such case what is the good motivation to start with some
> > > > > > >arbitrary
> > > > value?
> > > > > > >
> > > > > > > > I'm trying to fix this, and
> > > > > > > > we shouldn't force the device to always initialize with 0.
> > > > > > > >
> > > > > > > If driver is in control, driver decides what values to set.
> > > > > > > And hence, arbitrary value is
> > > > > >
> > > > > > Then maybe the driver is never set and the device uses a 0 which
> > > > > > messes up most data scenarios.
> > > > > >
> > > > > If driver does not want to set it, why did it enable the feature =
in first
> > place?
> > > > > So asking again, is it because driver enabled featured too early
> > > > > in the driver
> > > > load sequence, and not DIM is also disabled?
> > > >
> > > > I don't see the connection.
> > > >
> > > There is a connection.
> > >
> > > Basically, what you want is,
> > >
> > > 1. Driver negotiates feature bits during driver load.
> > >
> > > 2. Driver or user sometimes never configures the right coalescing
> > parameters.
> > >
> > > 3. Device to continue to apply the best coalescing parameters, typica=
lly keeps
> > changing based on the workload.
> >=20
> > Wait. Why does the device keeping changing the coalescing parameters if=
 the
> > driver does not modify parameters? Do you mean some kind of hw-DIM
> > running on the device?
> >
> Yes, If the device can choose one sane default one time to reduce perform=
ance regression, it likely can do few more times too.

Ok, I think we are now on a line:). I agree with this -->
I saw that some devices have hw-DIM or device-side dim, but in general,
many devices only have default values and no hardware DIM.

More below.

> =20
> > > The device to keep doing this until the driver takes the control of d=
oing it by-
> > itself.
> > > For example via net-dim enablement or user doing via ethtool.
> >=20
> > Right.
> >=20
> > >
> > > So what is needed is, not just have _one_ default value, but the devi=
ce ability
> > to constantly applying notification coalescing as desired.
> >=20
> > The "default parameters" I'm talking about is the "initial parameters",=
 are we
> > on the same line?
> Yes, but it does not have to be the initial parameters if the intention i=
s to avoid the performance regression.

I'm not sure if most devices carry hw-dim or device-side dim, but for those
devices that are not with hw-dim, there will be a default value, whether it=
 is
0 or non-zero. It is necessary to allow users to query this value.

Right?

>=20
> >=20
> > >
> > > When the driver issues the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> > command
> > > for the first time onwards, at that point, the device receives the
> > hint/indication, That now on, driver is in the control, hence the devic=
e should
> > stop applying its own logic.
> > >
> > > Just one default is not enough.
> > > And feature negotiation is of no help here at such an early stage.
> > >
> > > This is the limitation of feature bits negotiation and for now we nee=
d to live it
> > it.
> > >
> > > And heavy alternative that I prefer to avoid is keep the notification=
 features
> > disabled at default, re-initialize the driver when user enables the not=
ification
> > coaleasing.
> > > However, this is disruptive enough.
> > >
> > > So I propose that we draft the spec in device requirements as:.
> > >
> > > The device MAY apply any notification coalescing values when
> > VIRTIO_NET_F_VQ_NOTF_COAL or VIRTIO_NET_F_NOTF_COAL is negotiated,
> > until driver instruct the values for the first time.
> > > Once the driver has performed VIRTIO_NET_F_VQ_NOTF_COAL command
> > for a VQ or VIRTIO_NET_F_NOTF_COAL command for set of VQs, after that t=
he
> > device SHOULD generate notifications based on driver supplied parameter=
s.
> >=20
> > I've always agreed with this.
> >
> Ok. so lets please rephase this proposal to define how a devices should b=
ehave.

Ok. V3 will rephase the text.

>=20
> =20
> > >
> > > > >
> > > > > If feature is negotiated, than DIM can be enabled by default, and
> > > > > therefore
> > > > there is no need for the defaults?
> > > >
> > > > Right. But if DIM is not enabled (pls remember that DIM is just one
> > > > of the application scenarios of VQ_NOTF_COAL, right?), the user can
> > > > query the initial value of the device, which may be any value.
> > > >
> > > It is going to be just more than initial value, as device will have t=
o keep
> > changing the value.
> > >
> > > > >
> > > > > Or you are saying, that enabling DIM as default has some issue,
> > > > > and until
> > > > that point you prefer to have some default in the device?
> > > >
> > > > Partly true. The complete purpose is that the device can have any
> > > > default values
> > > > (0 or non-zero).
> > > >
> > > > >
> > > > > > Cloud vendors cannot do this. And I don=E2=80=99t seem to see a=
ny
> > > > > > interference with other devices from this proposal?
> > > > > > If the device does not want a non-zero value, a value of 0 can
> > > > > > be used as the default value.
> > > > > >
> > > > > I didn=E2=80=99t understand above.
> > > > >
> > > > > > >
> > > > > > > > Especially when the DIM is disabled from the enabled state,
> > > > > > > > allowing the driver to restore default parameters for device
> > > > > > > > will prevent occasional performance degradation.
> > > > > > > >
> > > > > > > When DIM is disabled, do you mean driver does not have any
> > > > > > > good
> > > > defaults?
> > > > > >
> > > > > > DIM is not guaranteed to have a friendly value when disabled.
> > > > > >
> > > > > I didn=E2=80=99t follow.
> > > > >
> > > > > (a) When DIM is enabled, DIM decides the value.
> > > > > (b) When DIM is disabled, zero is not good default in the device.
> > > > > Did I
> > > > understand right?
> > > > >
> > > > > I agree with (a) and (b).
> > > >
> > > > Right.
> > > >
> > > > >
> > > > > > > I guess this issue surfaces from the feature negotiation
> > > > > > > limitation that, it
> > > > > > must be done early enough before DRIVER_OK.
> > > > > > > And DIM is still disabled in driver.
> > > > > >
> > > > > > We lack the capability filed of default coalescing parameters,
> > > > > > so GET is used to alleviate this.
> > > > > >
> > > > > When GET is not supported, ethtool should get -ENOSUPP instead of=
 0.
> > > >
> > > > We don't have a separate feature bit for GET, right? So if
> > > > VQ_NOTF_COAL is negotiated, the device supports the GET command.
> > > >
> > > Yes, I meant to say that VIRTIO_NET_CTRL_NOTF_COAL and VQ_NOTF_COAL
> > both may not be offered.
> > > When only VIRTIO_NET_CTRL_NOTF_COAL is done, the driver can report -
> > ENOSUPP.
> > >
> >=20
> > I think "VIRTIO_NET_F_NOTF_COAL" and VQ_NOTF_COAL both may not be
> > offered?
> >=20
> Right. Don=E2=80=99t see a value of F_NOTF_COAL, once the VQ_NOTF_COAL is=
 offered.
>=20
> >=20
> > >
> > > > >
> > > > > > >
> > > > > > > That explains.
> > > > > > >
> > > > > > > Commit log needs to explain this limitation and the gain by
> > > > > > > relaxing it to be
> > > > > > non-zero.
> > > > > > >
> > > > > > > Any reason DIM is disabled by default in the driver?
> > > > > > > If VQ_NOTF_COAL is supported by device, DIM should be enabled
> > > > > > > by
> > > > > > default.
> > > > > >
> > > > > > virtio-net support for netdim needs to be optimized. Of course,
> > > > > > I also found that other network cards also have optimization po=
ints.
> > > > > >
> > > > > > I'm trying to enable DIM for upstream by default, after I've
> > > > > > done the profile list tuning etc.
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > Since the VIRTIO_NET_F_NOTF_COAL feature does not
> > > > > > > > > > provide a related GET command or config field, we still
> > > > > > > > > > consider its default values
> > > > > > to be 0.
> > > > > > > > > >
> > > > > > > > > The behavior for VIRTIO_NET_F_NOTF_COAL and
> > > > > > > > VIRTIO_NET_F_VQ_NOTF_COAL can stay same for the default val=
ue.
> > > > > > > > > Can you please explain the motivation for running
> > > > > > > > > different default values
> > > > > > > > for two different features in this commit log?
> > > > > > > >
> > > > > > > > The current spec leaves coalescing parameters for both feat=
ures at 0.
> > > > > > > >
> > > > > > > > F_VQ_NOTF_COAL provides a GET command, that is, non-zero 0
> > > > > > > > can be obtained by the driver from the device, but
> > > > > > > > F_NOTF_COAL does not have a similar GET command.
> > > > > > > >
> > > > > > > GET command doesn't give the ability to define the defaults.
> > > > > > > So both can have non zero defaults.
> > > > > >
> > > > > > Makes sense.
> > > > > >
> > > > > > >
> > > > > > > > So when vq reset occurs or dim is disabled from the enabled
> > > > > > > > state, the driver with F_VQ_NOTF_COAL negotiated has the
> > > > > > > > ability to restore non-zero values, but only when
> > > > > > > > F_NOTF_COAL is negotiated, the driver has no path to obtain
> > > > > > > > the non-zero value, let alone restore non-zero
> > > > > > values.
> > > > > > > >
> > > > > > > When F_NOTF_COAL is negotiated, if the device has its non zero
> > > > > > > defaults,
> > > > > > why does driver need to restore anything?
> > > > > >
> > > > > > Yes, device will set these.
> > > > > >
> > > > > Ok. so no restore needed.
> > > > >
> > > > > > > > >
> > > > > > > > > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > ---
> > > > > > > > > > v1->v2:
> > > > > > > > > >   - Update description @Jason.
> > > > > > > > > >
> > > > > > > > > >  device-types/net/description.tex | 22
> > > > > > > > > > +++++++++++++++-------
> > > > > > > > > >  1 file changed, 15 insertions(+), 7 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/device-types/net/description.tex b/device-
> > > > > > > > > > types/net/description.tex index 61cce1f..cf4b12c 100644
> > > > > > > > > > --- a/device-types/net/description.tex
> > > > > > > > > > +++ b/device-types/net/description.tex
> > > > > > > > > > @@ -1805,6 +1805,10 @@ \subsubsection{Control
> > > > > > > > > > Virtqueue}\label{sec:Device Types / Network Device /
> > > > > > > > > > Devi
> > > > > > > > > >
> > > > > > > > > >  The device may generate notifications more or less
> > > > > > > > > > frequently than specified by set commands of the
> > > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL
> > > > > > class.
> > > > > > > > > >
> > > > > > > > > > +If the VIRTIO_NET_F_VQ_NOTF_COAL feature is offered,
> > > > > > > > > > +the device may initialize the coalescing parameters for
> > > > > > > > > > +each transmit or receive virtqueue to non-zero values,
> > > > > > > > > > +otherwise, to 0, which are called default
> > > > > > > > > > coalescing parameters.
> > > > > > > > > > +
> > > > > > > > > Instead of 'offered', it should be 'negotiated'. Because
> > > > > > > > > if may be offered,
> > > > > > > > but driver may not have enabled it.
> > > > > > > >
> > > > > > > > I do not think so.
> > > > > > > >
> > > > > > > > Even if the driver does not negotiate, as long as the device
> > > > > > > > has the ability to adjust coalescing parameters (i.e.
> > > > > > > > offered), the device will initialize any values.
> > > > > > > >
> > > > > > > The device can initialize coalescing parameters regardless of
> > > > > > > VQ_NOTF_COAL
> > > > > > offered or not.
> > > > > > >
> > > > > >
> > > > > > Right.
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > >  If coalescing parameters are being set, the device
> > > > > > > > > > applies the last coalescing parameters set for a
> > > > > > > > > > virtqueue, regardless of the command used to set the
> > > > > > > > > > parameters. Use the following command sequence  with two
> > > > > > > > > > pairs of virtqueues as
> > > > an example:
> > > > > > > > > > @@ -1873,6 +1877,10 @@ \subsubsection{Control
> > > > > > > > > > Virtqueue}\label{sec:Device Types / Network Device /
> > > > > > > > > > Devi
> > > > > > > > > >
> > > > > > > > > >  The driver MUST ignore the values of coalescing
> > > > > > > > > > parameters received from the
> > > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> > > > command
> > > > > > > > > > if the device responds with VIRTIO_NET_ERR.
> > > > > > > > > >
> > > > > > > > > > +If the VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated,
> > > > > > > > > > +the driver
> > > > > > > > > > MUST
> > > > > > > > > > +get coalescing parameters for each enabled transmit or
> > > > > > > > > > +receive virtqueue through the
> > > > > > > > > > +VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> > > > > > > > command
> > > > > > > > > > after a successful device reset.
> > > > > > > > > > +
> > > > > > > > > The driver is free to not call GET call at all. It can al=
ways just do set.
> > > > > > > > > So it cannot be must requirement for the driver to get th=
em.
> > > > > > > >
> > > > > > > > This is mainly forced to MUST during the probe phase.
> > > > > > > > Other timings, the existing spec has already described it c=
learly.
> > > > > > > >
> > > > > > > I don't see it is needed to force driver to read.
> > > > > > > Why is it must for the driver to read it? It can operate with=
out read.
> > > > > >
> > > > > > Otherwise the device has a non-zero default value, but users
> > > > > > using ethtool -c see a value of 0.
> > > > > >
> > > > > When GET is supported, ethtool callback should query the current =
value.
> > > > > Driver can read it once at start time, but it is not a MUST requi=
rement.
> > > > > Driver can read it runtime too. It is the driver implementation c=
hoice.
> > > > > We don=E2=80=99t need to tell in the spec, when driver MUST read =
it.
> > > >
> > > > I agree with this.
> > > >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > The wording should be, the driver MAY get ...
> > > > > > > > >
> > > > > > > > > >  \devicenormative{\subparagraph}{Notifications
> > > > > > > > > > Coalescing}{Device Types / Network Device / Device
> > > > > > > > > > Operation / Control Virtqueue / Notifications
> > > > > > > > > > Coalescing}
> > > > > > > > > >
> > > > > > > > > >  The device MUST ignore \field{reserved}.
> > > > > > > > > > @@ -1884,18 +1892,18 @@ \subsubsection{Control
> > > > > > > > > > Virtqueue}\label{sec:Device Types / Network Device /
> > > > > > > > > > Devi The device MUST respond to
> > > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> > > > > > > > > > and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with
> > > > > > > > VIRTIO_NET_ERR if
> > > > > > > > > > the designated virtqueue is not an enabled transmit or
> > > > > > > > > > receive
> > > > > > virtqueue.
> > > > > > > > > >
> > > > > > > > > > -Upon disabling and re-enabling a transmit virtqueue,
> > > > > > > > > > the device MUST set the coalescing parameters of the
> > > > > > > > > > virtqueue -to those configured through the
> > > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> > > > > > > > command, or,
> > > > > > > > > > if the driver did not set any TX coalescing parameters,=
 to 0.
> > > > > > > > > > -
> > > > > > > > > > -Upon disabling and re-enabling a receive virtqueue, the
> > > > > > > > > > device MUST set the coalescing parameters of the
> > > > > > > > > > virtqueue -to those configured through the
> > > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
> > > > > > command,
> > > > > > > > > > or, if the driver did not set any RX coalescing paramet=
ers, to 0.
> > > > > > > > > > -
> > > > > > > > > >  The behavior of the device in response to set commands
> > > > > > > > > > of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > > > > > > > > >  the device MAY generate notifications more or less
> > > > > > > > > > frequently than specified.
> > > > > > > > > >
> > > > > > > > > >  A device SHOULD NOT send used buffer notifications to
> > > > > > > > > > the driver if the notifications are suppressed, even if
> > > > > > > > > > the notification conditions are
> > > > > > > > met.
> > > > > > > > > >
> > > > > > > > > > -Upon reset, a device MUST initialize all coalescing
> > > > > > > > > > parameters to
> > > > 0.
> > > > > > > > > > +Upon reset, a device MUST set default coalescing
> > > > > > > > > > +parameters for all transmit or receive virtqueues.
> > > > > > > > > > +
> > > > > > > > > The device MAY set parameters to zero or non zero values..
> > > > > > > >
> > > > > > > > Ok.
> > > > > > > >
> > > > > > > > > I am still missing the motivation part of why to set non
> > > > > > > > > zero value, even if
> > > > > > > > the driver has negotiated the feature.
> > > > > > > >
> > > > > > > > Please see the above description.
> > > > > > > >
> > > > > > > If I understood is right, the case is:
> > > > > > > _VQ_NOTF_COAL is negotiated, and DIM is disabled.
> > > > > > > And device is unable to apply some good non zero defaults.
> > > > > >
> > > > > >
> > > > > > If _VQ_NOTF_COAL is negotiated, and DIM is disabled:
> > > > > >
> > > > > > 1. The device wants to set a non-zero value for good perf,
> > > > > >    but the user sees a value of 0.
> > > > > >
> > > > > The only limitation that we want to remove is, on device reset,
> > > > > the device
> > > > may have any default value.
> > > >
> > > > Right, and the driver may query the value using the GET command.
> > > >
> > > > >
> > > > > > 2. When the user has not actively modified the value, DIM
> > > > > > switches from
> > > > the
> > > > > >    enabled state to the disabled state, then the driver expects=
 to issue a
> > > > > >    setting command with a default value. To avoid performance
> > > > degradation
> > > > > >    caused by a bad value.
> > > > > >
> > > > > This #2 seems like some hack. Should I read the Linux code in thi=
s area?
> > > >
> > > > No. This is some kind of performance optimization at the code level.
> > > > When DIM is turned off, the driver configures default values for the
> > > > device to avoid any big performance regression.
> > > >
> > > If the driver configures the default, we don=E2=80=99t need device to=
 apply any
> > defaults.
> >=20
> > when does the driver configure the default value (actually I mean the i=
nitial
> > value) and how does the driver know which default (initial value) value=
 applies
> > to all devices?
> >=20
> I don=E2=80=99t think the driver can apply.
> I understood that you wanted the driver to configure some default from wh=
at you wrote as=20
> " When DIM is turned off, the driver configures default values for the de=
vice to avoid any big performance regression."

Maybe I didn't describe it clearly, consider the following scenario:
1. The driver may obtain the initial value. If not, the value is 0. ---> Th=
is initial value called default value.
2. User query the coalescing parameters.  ---> Driver return the default va=
lue.
3. dim is disabled from enabled state -> Driver restores the device using t=
he default value obtained from the device.

Thanks.

>=20
> > Thanks.
> >=20
> > > I thought your intention was, the driver does not know what is the be=
st
> > notification rate to configure and feature is enabled in the device.
> > > And the device does not have any good defaults (because driver is not
> > configuring any defaults).
> > >
> > > But here you say, the driver configures the drefault. I am lost. =E2=
=98=B9
> > >
> > > > >
> > > > > > We assume that most users do not have the prerequisite knowledge
> > > > > > to modify coalecing parameters.
> > > > > >
> > > > > Right. Hence the DIM should be used.
> > > > > When DIM is not used, a non zero default is good to have.
> > > > > (without forcing the driver to read it).
> > > >
> > > > +1
> > > >
> > > > Thanks.
> > > >
> > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > >
> > > > > > > Right?
> > > > > > >
> > > > > > >
> > > > > > > > Thanks.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > +Regardless of whether the coalescing parameters have
> > > > > > > > > > +been overridden by set commands from the
> > > > > > VIRTIO_NET_CTRL_NOTF_COAL
> > > > > > > > > > +class, upon
> > > > > > > > > > disabling
> > > > > > > > > > +and re-enabling a transmit or receive virtqueue, the
> > > > > > > > > > +device MUST set the previous parameters for the virtqu=
eue.
> > > > > > > > > >
> > > > > > > > > >  \paragraph{Device Statistics}\label{sec:Device Types /
> > > > > > > > > > Network Device / Device Operation / Control Virtqueue /
> > > > > > > > > > Device Statistics}
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > 2.32.0.3.g01195cf9f
> > > > > > > > >
> > > > >
> > >
>=20
