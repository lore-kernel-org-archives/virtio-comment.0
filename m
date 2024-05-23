Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8195933EA
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 04:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716437049; cv=none; b=jlDs7ZMRD1E00f9EweXlEZliivgLuOFMRMDw40MKPjsthDCS/54AZEVIokjitx7Zc761uW58cPVv9sx9AHEEfuSw5Z/e+LguSPj4czrneU5eeRCXrmDSBZ/7n1Le9m5pPq552knC3Yedy5fBbgl4w9KlC3PUVgT3z8b7E63BPFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716437049; c=relaxed/simple;
	bh=+tLgvEwDKMXQ43XRqNc7KHH46xTPNkLRjbHyRSjGNCY=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To:
	 Content-Type; b=KZ1spHrmffbQouSIfJ8h67DPf093MkWjeL8xXKZgTAAeIVMfS1Xo7q0bULgHOv8yghDtWLVKkg7kZuq3rpGfAnivEZjMhYrqAP3mZv1uabn+tE1PuUns9lq+h0oE4yynX6e7CEKqF/306aP3SVSIV/hMVtcywaaAOWwut4ToURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vX/hSMCo; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vX/hSMCo"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716437037; h=Message-ID:Subject:Date:From:To:Content-Type;
	bh=WG7tZuTbTWKOe8lrAlLrZI3zeY0nA9kCtze3FmWXLgw=;
	b=vX/hSMCoGxUzlIhlIWDOl5bmET0PsAtD8fWbwV5TMoSUwgPyvMpIR6a1d29TRlsNzdiRiaQOZ1qElB984VhGiWyMYiQPZ5vA5GI5LHt8SRZ6iiahRWmzDzPcu+bOAzzkLrIWiyRZkICoxIZX5Ysq/9KsSBb2uo1I7LUeG0G6MJ4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0W71MI09_1716436719;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W71MI09_1716436719)
          by smtp.aliyun-inc.com;
          Thu, 23 May 2024 11:58:40 +0800
Message-ID: <1716436686.2428358-1-hengqi@linux.alibaba.com>
Subject: Re: RE: RE: RE: RE: RE: RE: [PATCH v2] virtio-net: improve description of default coalescing parameters
Date: Thu, 23 May 2024 11:58:06 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Jason Wang <jasowang@redhat.com>,
 "Michael    S .   Tsirkin" <mst@redhat.com>,
 Parav Pandit <parav@nvidia.com>
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
 <1716343906.6530488-1-hengqi@linux.alibaba.com>
 <PH0PR12MB548111559E31123D48A63A4CDCEB2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1716349740.8213844-2-hengqi@linux.alibaba.com>
In-Reply-To: <1716349740.8213844-2-hengqi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Wed, 22 May 2024 11:49:00 +0800, Heng Qi <hengqi@linux.alibaba.com> wrot=
e:
> On Wed, 22 May 2024 03:44:45 +0000, Parav Pandit <parav@nvidia.com> wrote:
> >=20
> >=20
> > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > Sent: Wednesday, May 22, 2024 7:42 AM
> > >=20
> > > On Tue, 21 May 2024 13:55:19 +0000, Parav Pandit <parav@nvidia.com>
> > > wrote:
> > > >
> > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > Sent: Tuesday, May 21, 2024 3:34 PM
> > > > >
> > > > > On Tue, 21 May 2024 06:02:15 +0000, Parav Pandit <parav@nvidia.co=
m>
> > > > > wrote:
> > > > > >
> > > > > >
> > > > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > Sent: Tuesday, May 21, 2024 7:54 AM On Tue, 14 May 2024 13:09=
:32
> > > > > > > +0000, Parav Pandit <parav@nvidia.com>
> > > > > > > wrote:
> > > > > > > >
> > > > > > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > Sent: Tuesday, May 14, 2024 1:23 PM
> > > > > > > > >
> > > > > > > > > On Tue, 14 May 2024 07:48:55 +0000, Parav Pandit
> > > > > > > > > <parav@nvidia.com>
> > > > > > > > > wrote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > > Sent: Tuesday, May 14, 2024 11:23 AM
> > > > > > > > > > >
> > > > > > > > > > > On Tue, 14 May 2024 03:59:52 +0000, Parav Pandit
> > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > > wrote:
> > > > > > > > > > > > Hi Heng,
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > > > > Sent: Monday, May 13, 2024 6:27 PM
> > > > > > > > > > > > >
> > > > > > > > > > > > > Currently, a device may initialize each vq's
> > > > > > > > > > > > > coalescing parameters to empirically non-zero
> > > > > > > > > > > > > values, so the description of this part is supple=
mented for
> > > the virtio spec.
> > > > > > > > > > > > >
> > > > > > > > > > > > Currently the spec says to initialize the vq's
> > > > > > > > > > > > coalescing parameters to
> > > > > > > zero.
> > > > > > > > > > > >
> > > > > > > > > > > > Spec snippet: " Upon reset, a device MUST initialize
> > > > > > > > > > > > all coalescing
> > > > > > > > > > > parameters to 0."
> > > > > > > > > > > >
> > > > > > > > > > > > So I didn't understand why you say "current the dev=
ice
> > > > > > > > > > > > may
> > > > > > > initialize".
> > > > > > > > > > > >
> > > > > > > > > > > > Do you mean, you want to change the spec to say, by
> > > > > > > > > > > > default the device has
> > > > > > > > > > > chosen to set zero or non-zero default parameter as i=
t likes.
> > > > > > > > > > > > (and not zero).
> > > > > > > > > > >
> > > > > > > > > > > Yes.
> > > > > > > > > > >
> > > > > > > > > > > If a device supports interrupt coalescing moderation,=
 it
> > > > > > > > > > > usually has a non- zero default value to provide bett=
er
> > > performance.
> > > > > > > > > > When VIRTIO_NET_F_VQ_NOTF_COAL or
> > > VIRTIO_NET_F_NOTF_COAL
> > > > > is
> > > > > > > not
> > > > > > > > > negotiated, the device can apply any notification coalesc=
ing value.
> > > > > > > > > > (assuming EVENT_IDX is off).
> > > > > > > > > >
> > > > > > > > > > But when they above features are negotiated, it is
> > > > > > > > > > expected that driver is going to driver it,
> > > > > > > > >
> > > > > > > > > The driver drives the runtime parameters without conflict=
ing
> > > > > > > > > with the initial default values.
> > > > > > > > > And most users/drivers without dim enable may not drive i=
t.
> > > > > > > > >
> > > > > > > > There is no conflict in runtime or default parameters.
> > > > > > > > For driver it starts after 10msec or 4 minutes, both are
> > > > > > > > runtime
> > > > > parameters.
> > > > > > > >
> > > > > > > > > The device need to be defensive about default performance.
> > > > > > > > >
> > > > > > > > The device can surely offer the default performance with non
> > > > > > > > zero default
> > > > > > > values.
> > > > > > >
> > > > > > > That's what I'm mentioning.
> > > > > > >
> > > > > > > >
> > > > > > > > > >in such case what is the good motivation to start with s=
ome
> > > > > > > > > >arbitrary
> > > > > > > value?
> > > > > > > > > >
> > > > > > > > > > > I'm trying to fix this, and we shouldn't force the
> > > > > > > > > > > device to always initialize with 0.
> > > > > > > > > > >
> > > > > > > > > > If driver is in control, driver decides what values to =
set.
> > > > > > > > > > And hence, arbitrary value is
> > > > > > > > >
> > > > > > > > > Then maybe the driver is never set and the device uses a 0
> > > > > > > > > which messes up most data scenarios.
> > > > > > > > >
> > > > > > > > If driver does not want to set it, why did it enable the
> > > > > > > > feature in first
> > > > > place?
> > > > > > > > So asking again, is it because driver enabled featured too
> > > > > > > > early in the driver
> > > > > > > load sequence, and not DIM is also disabled?
> > > > > > >
> > > > > > > I don't see the connection.
> > > > > > >
> > > > > > There is a connection.
> > > > > >
> > > > > > Basically, what you want is,
> > > > > >
> > > > > > 1. Driver negotiates feature bits during driver load.
> > > > > >
> > > > > > 2. Driver or user sometimes never configures the right coalesci=
ng
> > > > > parameters.
> > > > > >
> > > > > > 3. Device to continue to apply the best coalescing parameters,
> > > > > > typically keeps
> > > > > changing based on the workload.
> > > > >
> > > > > Wait. Why does the device keeping changing the coalescing paramet=
ers
> > > > > if the driver does not modify parameters? Do you mean some kind of
> > > > > hw-DIM running on the device?
> > > > >
> > > > Yes, If the device can choose one sane default one time to reduce
> > > performance regression, it likely can do few more times too.
> > >=20
> > > Ok, I think we are now on a line:). I agree with this --> I saw that =
some
> > > devices have hw-DIM or device-side dim, but in general, many devices =
only
> > > have default values and no hardware DIM.
> > >=20
> > I am not sure. each one has different view of how they see the device i=
n their own and other cloud operators place.
> > The key part to me is, the device may apply some coalescing value until=
 the driver tells him to stop applying its values.
> > The device may apply same value or different value, it is in the device=
 boundary.
> >=20
> > Hence, the below spec wording is what matters.
> >=20
> >=20
> > > More below.
> > >=20
> > > >
> > > > > > The device to keep doing this until the driver takes the control
> > > > > > of doing it by-
> > > > > itself.
> > > > > > For example via net-dim enablement or user doing via ethtool.
> > > > >
> > > > > Right.
> > > > >
> > > > > >
> > > > > > So what is needed is, not just have _one_ default value, but the
> > > > > > device ability
> > > > > to constantly applying notification coalescing as desired.
> > > > >
> > > > > The "default parameters" I'm talking about is the "initial
> > > > > parameters", are we on the same line?
> > > > Yes, but it does not have to be the initial parameters if the inten=
tion is to
> > > avoid the performance regression.
> > >=20
> > > I'm not sure if most devices carry hw-dim or device-side dim, but for=
 those
> > > devices that are not with hw-dim, there will be a default value, whet=
her it is
> > > 0 or non-zero. It is necessary to allow users to query this value.
> > >=20
> > > Right?
> > >=20
> > Yes, the driver can query and supply to users; whether that value is de=
fault or current, it depends on when the driver queries them.
> > So to keep it simple, driver always queries the current value before or=
 after the VQ_SET command from driver point of view.
> > The device may apply any value before the VQ_SET command is done and dr=
iver should be able to query it as long as _F bit is negotiated.
> > It is straight forward.
>=20
> +1
>=20
> Everything looks clear.

Hi all!

A new version has been released with a new patch name:

https://lore.kernel.org/virtio-comment/20240523032332.50995-1-hengqi@linux.=
alibaba.com/T/#u

Thanks.

>=20
> Thanks!
>=20
>=20
> >=20
> > > >
> > > > >
> > > > > >
> > > > > > When the driver issues the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> > > > > command
> > > > > > for the first time onwards, at that point, the device receives =
the
> > > > > hint/indication, That now on, driver is in the control, hence the
> > > > > device should stop applying its own logic.
> > > > > >
> > > > > > Just one default is not enough.
> > > > > > And feature negotiation is of no help here at such an early sta=
ge.
> > > > > >
> > > > > > This is the limitation of feature bits negotiation and for now =
we
> > > > > > need to live it
> > > > > it.
> > > > > >
> > > > > > And heavy alternative that I prefer to avoid is keep the
> > > > > > notification features
> > > > > disabled at default, re-initialize the driver when user enables t=
he
> > > > > notification coaleasing.
> > > > > > However, this is disruptive enough.
> > > > > >
> > > > > > So I propose that we draft the spec in device requirements as:.
> > > > > >
> > > > > > The device MAY apply any notification coalescing values when
> > > > > VIRTIO_NET_F_VQ_NOTF_COAL or VIRTIO_NET_F_NOTF_COAL is
> > > negotiated,
> > > > > until driver instruct the values for the first time.
> > > > > > Once the driver has performed VIRTIO_NET_F_VQ_NOTF_COAL
> > > command
> > > > > for a VQ or VIRTIO_NET_F_NOTF_COAL command for set of VQs, after
> > > > > that the device SHOULD generate notifications based on driver sup=
plied
> > > parameters.
> > > > >
> > > > > I've always agreed with this.
> > > > >
> > > > Ok. so lets please rephase this proposal to define how a devices sh=
ould
> > > behave.
> > >=20
> > > Ok. V3 will rephase the text.
> > >=20
> > Ok. thanks.
> >=20
> > > >
> > > >
> > > > > >
> > > > > > > >
> > > > > > > > If feature is negotiated, than DIM can be enabled by defaul=
t,
> > > > > > > > and therefore
> > > > > > > there is no need for the defaults?
> > > > > > >
> > > > > > > Right. But if DIM is not enabled (pls remember that DIM is ju=
st
> > > > > > > one of the application scenarios of VQ_NOTF_COAL, right?), the
> > > > > > > user can query the initial value of the device, which may be =
any value.
> > > > > > >
> > > > > > It is going to be just more than initial value, as device will
> > > > > > have to keep
> > > > > changing the value.
> > > > > >
> > > > > > > >
> > > > > > > > Or you are saying, that enabling DIM as default has some
> > > > > > > > issue, and until
> > > > > > > that point you prefer to have some default in the device?
> > > > > > >
> > > > > > > Partly true. The complete purpose is that the device can have
> > > > > > > any default values
> > > > > > > (0 or non-zero).
> > > > > > >
> > > > > > > >
> > > > > > > > > Cloud vendors cannot do this. And I don=E2=80=99t seem to=
 see any
> > > > > > > > > interference with other devices from this proposal?
> > > > > > > > > If the device does not want a non-zero value, a value of 0
> > > > > > > > > can be used as the default value.
> > > > > > > > >
> > > > > > > > I didn=E2=80=99t understand above.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > Especially when the DIM is disabled from the enabled
> > > > > > > > > > > state, allowing the driver to restore default paramet=
ers
> > > > > > > > > > > for device will prevent occasional performance degrad=
ation.
> > > > > > > > > > >
> > > > > > > > > > When DIM is disabled, do you mean driver does not have =
any
> > > > > > > > > > good
> > > > > > > defaults?
> > > > > > > > >
> > > > > > > > > DIM is not guaranteed to have a friendly value when disab=
led.
> > > > > > > > >
> > > > > > > > I didn=E2=80=99t follow.
> > > > > > > >
> > > > > > > > (a) When DIM is enabled, DIM decides the value.
> > > > > > > > (b) When DIM is disabled, zero is not good default in the d=
evice.
> > > > > > > > Did I
> > > > > > > understand right?
> > > > > > > >
> > > > > > > > I agree with (a) and (b).
> > > > > > >
> > > > > > > Right.
> > > > > > >
> > > > > > > >
> > > > > > > > > > I guess this issue surfaces from the feature negotiation
> > > > > > > > > > limitation that, it
> > > > > > > > > must be done early enough before DRIVER_OK.
> > > > > > > > > > And DIM is still disabled in driver.
> > > > > > > > >
> > > > > > > > > We lack the capability filed of default coalescing
> > > > > > > > > parameters, so GET is used to alleviate this.
> > > > > > > > >
> > > > > > > > When GET is not supported, ethtool should get -ENOSUPP inst=
ead of
> > > 0.
> > > > > > >
> > > > > > > We don't have a separate feature bit for GET, right? So if
> > > > > > > VQ_NOTF_COAL is negotiated, the device supports the GET
> > > command.
> > > > > > >
> > > > > > Yes, I meant to say that VIRTIO_NET_CTRL_NOTF_COAL and
> > > > > > VQ_NOTF_COAL
> > > > > both may not be offered.
> > > > > > When only VIRTIO_NET_CTRL_NOTF_COAL is done, the driver can
> > > report
> > > > > > -
> > > > > ENOSUPP.
> > > > > >
> > > > >
> > > > > I think "VIRTIO_NET_F_NOTF_COAL" and VQ_NOTF_COAL both may not
> > > be
> > > > > offered?
> > > > >
> > > > Right. Don=E2=80=99t see a value of F_NOTF_COAL, once the VQ_NOTF_C=
OAL is
> > > offered.
> > > >
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > That explains.
> > > > > > > > > >
> > > > > > > > > > Commit log needs to explain this limitation and the gain
> > > > > > > > > > by relaxing it to be
> > > > > > > > > non-zero.
> > > > > > > > > >
> > > > > > > > > > Any reason DIM is disabled by default in the driver?
> > > > > > > > > > If VQ_NOTF_COAL is supported by device, DIM should be
> > > > > > > > > > enabled by
> > > > > > > > > default.
> > > > > > > > >
> > > > > > > > > virtio-net support for netdim needs to be optimized. Of
> > > > > > > > > course, I also found that other network cards also have
> > > optimization points.
> > > > > > > > >
> > > > > > > > > I'm trying to enable DIM for upstream by default, after I=
've
> > > > > > > > > done the profile list tuning etc.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > Since the VIRTIO_NET_F_NOTF_COAL feature does not
> > > > > > > > > > > > > provide a related GET command or config field, we
> > > > > > > > > > > > > still consider its default values
> > > > > > > > > to be 0.
> > > > > > > > > > > > >
> > > > > > > > > > > > The behavior for VIRTIO_NET_F_NOTF_COAL and
> > > > > > > > > > > VIRTIO_NET_F_VQ_NOTF_COAL can stay same for the defau=
lt
> > > value.
> > > > > > > > > > > > Can you please explain the motivation for running
> > > > > > > > > > > > different default values
> > > > > > > > > > > for two different features in this commit log?
> > > > > > > > > > >
> > > > > > > > > > > The current spec leaves coalescing parameters for both
> > > features at 0.
> > > > > > > > > > >
> > > > > > > > > > > F_VQ_NOTF_COAL provides a GET command, that is, non-z=
ero
> > > > > > > > > > > 0 can be obtained by the driver from the device, but
> > > > > > > > > > > F_NOTF_COAL does not have a similar GET command.
> > > > > > > > > > >
> > > > > > > > > > GET command doesn't give the ability to define the defa=
ults.
> > > > > > > > > > So both can have non zero defaults.
> > > > > > > > >
> > > > > > > > > Makes sense.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > So when vq reset occurs or dim is disabled from the
> > > > > > > > > > > enabled state, the driver with F_VQ_NOTF_COAL negotia=
ted
> > > > > > > > > > > has the ability to restore non-zero values, but only
> > > > > > > > > > > when F_NOTF_COAL is negotiated, the driver has no path
> > > > > > > > > > > to obtain the non-zero value, let alone restore non-z=
ero
> > > > > > > > > values.
> > > > > > > > > > >
> > > > > > > > > > When F_NOTF_COAL is negotiated, if the device has its n=
on
> > > > > > > > > > zero defaults,
> > > > > > > > > why does driver need to restore anything?
> > > > > > > > >
> > > > > > > > > Yes, device will set these.
> > > > > > > > >
> > > > > > > > Ok. so no restore needed.
> > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > > v1->v2:
> > > > > > > > > > > > >   - Update description @Jason.
> > > > > > > > > > > > >
> > > > > > > > > > > > >  device-types/net/description.tex | 22
> > > > > > > > > > > > > +++++++++++++++-------
> > > > > > > > > > > > >  1 file changed, 15 insertions(+), 7 deletions(-)
> > > > > > > > > > > > >
> > > > > > > > > > > > > diff --git a/device-types/net/description.tex
> > > > > > > > > > > > > b/device- types/net/description.tex index
> > > > > > > > > > > > > 61cce1f..cf4b12c 100644
> > > > > > > > > > > > > --- a/device-types/net/description.tex
> > > > > > > > > > > > > +++ b/device-types/net/description.tex
> > > > > > > > > > > > > @@ -1805,6 +1805,10 @@ \subsubsection{Control
> > > > > > > > > > > > > Virtqueue}\label{sec:Device Types / Network Devic=
e /
> > > > > > > > > > > > > Devi
> > > > > > > > > > > > >
> > > > > > > > > > > > >  The device may generate notifications more or le=
ss
> > > > > > > > > > > > > frequently than specified by set commands of the
> > > > > > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL
> > > > > > > > > class.
> > > > > > > > > > > > >
> > > > > > > > > > > > > +If the VIRTIO_NET_F_VQ_NOTF_COAL feature is
> > > > > > > > > > > > > +offered, the device may initialize the coalescing
> > > > > > > > > > > > > +parameters for each transmit or receive virtqueue
> > > > > > > > > > > > > +to non-zero values, otherwise, to 0, which are
> > > > > > > > > > > > > +called default
> > > > > > > > > > > > > coalescing parameters.
> > > > > > > > > > > > > +
> > > > > > > > > > > > Instead of 'offered', it should be 'negotiated'.
> > > > > > > > > > > > Because if may be offered,
> > > > > > > > > > > but driver may not have enabled it.
> > > > > > > > > > >
> > > > > > > > > > > I do not think so.
> > > > > > > > > > >
> > > > > > > > > > > Even if the driver does not negotiate, as long as the
> > > > > > > > > > > device has the ability to adjust coalescing parameter=
s (i.e.
> > > > > > > > > > > offered), the device will initialize any values.
> > > > > > > > > > >
> > > > > > > > > > The device can initialize coalescing parameters regardl=
ess
> > > > > > > > > > of VQ_NOTF_COAL
> > > > > > > > > offered or not.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Right.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > >  If coalescing parameters are being set, the devi=
ce
> > > > > > > > > > > > > applies the last coalescing parameters set for a
> > > > > > > > > > > > > virtqueue, regardless of the command used to set =
the
> > > > > > > > > > > > > parameters. Use the following command sequence  w=
ith
> > > > > > > > > > > > > two pairs of virtqueues as
> > > > > > > an example:
> > > > > > > > > > > > > @@ -1873,6 +1877,10 @@ \subsubsection{Control
> > > > > > > > > > > > > Virtqueue}\label{sec:Device Types / Network Devic=
e /
> > > > > > > > > > > > > Devi
> > > > > > > > > > > > >
> > > > > > > > > > > > >  The driver MUST ignore the values of coalescing
> > > > > > > > > > > > > parameters received from the
> > > > > > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> > > > > > > command
> > > > > > > > > > > > > if the device responds with VIRTIO_NET_ERR.
> > > > > > > > > > > > >
> > > > > > > > > > > > > +If the VIRTIO_NET_F_VQ_NOTF_COAL feature is
> > > > > > > > > > > > > +negotiated, the driver
> > > > > > > > > > > > > MUST
> > > > > > > > > > > > > +get coalescing parameters for each enabled trans=
mit
> > > > > > > > > > > > > +or receive virtqueue through the
> > > > > > > > > > > > > +VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> > > > > > > > > > > command
> > > > > > > > > > > > > after a successful device reset.
> > > > > > > > > > > > > +
> > > > > > > > > > > > The driver is free to not call GET call at all. It =
can always just
> > > do set.
> > > > > > > > > > > > So it cannot be must requirement for the driver to =
get them.
> > > > > > > > > > >
> > > > > > > > > > > This is mainly forced to MUST during the probe phase.
> > > > > > > > > > > Other timings, the existing spec has already describe=
d it clearly.
> > > > > > > > > > >
> > > > > > > > > > I don't see it is needed to force driver to read.
> > > > > > > > > > Why is it must for the driver to read it? It can operat=
e without
> > > read.
> > > > > > > > >
> > > > > > > > > Otherwise the device has a non-zero default value, but us=
ers
> > > > > > > > > using ethtool -c see a value of 0.
> > > > > > > > >
> > > > > > > > When GET is supported, ethtool callback should query the cu=
rrent
> > > value.
> > > > > > > > Driver can read it once at start time, but it is not a MUST
> > > requirement.
> > > > > > > > Driver can read it runtime too. It is the driver implementa=
tion
> > > choice.
> > > > > > > > We don=E2=80=99t need to tell in the spec, when driver MUST=
 read it.
> > > > > > >
> > > > > > > I agree with this.
> > > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > The wording should be, the driver MAY get ...
> > > > > > > > > > > >
> > > > > > > > > > > > >  \devicenormative{\subparagraph}{Notifications
> > > > > > > > > > > > > Coalescing}{Device Types / Network Device / Device
> > > > > > > > > > > > > Operation / Control Virtqueue / Notifications
> > > > > > > > > > > > > Coalescing}
> > > > > > > > > > > > >
> > > > > > > > > > > > >  The device MUST ignore \field{reserved}.
> > > > > > > > > > > > > @@ -1884,18 +1892,18 @@ \subsubsection{Control
> > > > > > > > > > > > > Virtqueue}\label{sec:Device Types / Network Devic=
e /
> > > > > > > > > > > > > Devi The device MUST respond to
> > > > > > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> > > > > > > > > > > > > and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands
> > > with
> > > > > > > > > > > VIRTIO_NET_ERR if
> > > > > > > > > > > > > the designated virtqueue is not an enabled transm=
it
> > > > > > > > > > > > > or receive
> > > > > > > > > virtqueue.
> > > > > > > > > > > > >
> > > > > > > > > > > > > -Upon disabling and re-enabling a transmit
> > > > > > > > > > > > > virtqueue, the device MUST set the coalescing
> > > > > > > > > > > > > parameters of the virtqueue -to those configured
> > > > > > > > > > > > > through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> > > > > > > > > > > command, or,
> > > > > > > > > > > > > if the driver did not set any TX coalescing param=
eters, to 0.
> > > > > > > > > > > > > -
> > > > > > > > > > > > > -Upon disabling and re-enabling a receive virtque=
ue,
> > > > > > > > > > > > > the device MUST set the coalescing parameters of =
the
> > > > > > > > > > > > > virtqueue -to those configured through the
> > > > > > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
> > > > > > > > > command,
> > > > > > > > > > > > > or, if the driver did not set any RX coalescing p=
arameters, to
> > > 0.
> > > > > > > > > > > > > -
> > > > > > > > > > > > >  The behavior of the device in response to set
> > > > > > > > > > > > > commands of the VIRTIO_NET_CTRL_NOTF_COAL class is
> > > best-effort:
> > > > > > > > > > > > >  the device MAY generate notifications more or le=
ss
> > > > > > > > > > > > > frequently than specified.
> > > > > > > > > > > > >
> > > > > > > > > > > > >  A device SHOULD NOT send used buffer notificatio=
ns
> > > > > > > > > > > > > to the driver if the notifications are suppressed,
> > > > > > > > > > > > > even if the notification conditions are
> > > > > > > > > > > met.
> > > > > > > > > > > > >
> > > > > > > > > > > > > -Upon reset, a device MUST initialize all coalesc=
ing
> > > > > > > > > > > > > parameters to
> > > > > > > 0.
> > > > > > > > > > > > > +Upon reset, a device MUST set default coalescing
> > > > > > > > > > > > > +parameters for all transmit or receive virtqueue=
s.
> > > > > > > > > > > > > +
> > > > > > > > > > > > The device MAY set parameters to zero or non zero v=
alues..
> > > > > > > > > > >
> > > > > > > > > > > Ok.
> > > > > > > > > > >
> > > > > > > > > > > > I am still missing the motivation part of why to set
> > > > > > > > > > > > non zero value, even if
> > > > > > > > > > > the driver has negotiated the feature.
> > > > > > > > > > >
> > > > > > > > > > > Please see the above description.
> > > > > > > > > > >
> > > > > > > > > > If I understood is right, the case is:
> > > > > > > > > > _VQ_NOTF_COAL is negotiated, and DIM is disabled.
> > > > > > > > > > And device is unable to apply some good non zero defaul=
ts.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > If _VQ_NOTF_COAL is negotiated, and DIM is disabled:
> > > > > > > > >
> > > > > > > > > 1. The device wants to set a non-zero value for good perf,
> > > > > > > > >    but the user sees a value of 0.
> > > > > > > > >
> > > > > > > > The only limitation that we want to remove is, on device
> > > > > > > > reset, the device
> > > > > > > may have any default value.
> > > > > > >
> > > > > > > Right, and the driver may query the value using the GET comma=
nd.
> > > > > > >
> > > > > > > >
> > > > > > > > > 2. When the user has not actively modified the value, DIM
> > > > > > > > > switches from
> > > > > > > the
> > > > > > > > >    enabled state to the disabled state, then the driver e=
xpects to
> > > issue a
> > > > > > > > >    setting command with a default value. To avoid
> > > > > > > > > performance
> > > > > > > degradation
> > > > > > > > >    caused by a bad value.
> > > > > > > > >
> > > > > > > > This #2 seems like some hack. Should I read the Linux code =
in this
> > > area?
> > > > > > >
> > > > > > > No. This is some kind of performance optimization at the code=
 level.
> > > > > > > When DIM is turned off, the driver configures default values =
for
> > > > > > > the device to avoid any big performance regression.
> > > > > > >
> > > > > > If the driver configures the default, we don=E2=80=99t need dev=
ice to
> > > > > > apply any
> > > > > defaults.
> > > > >
> > > > > when does the driver configure the default value (actually I mean
> > > > > the initial
> > > > > value) and how does the driver know which default (initial value)
> > > > > value applies to all devices?
> > > > >
> > > > I don=E2=80=99t think the driver can apply.
> > > > I understood that you wanted the driver to configure some default f=
rom
> > > > what you wrote as " When DIM is turned off, the driver configures d=
efault
> > > values for the device to avoid any big performance regression."
> > >=20
> > > Maybe I didn't describe it clearly, consider the following scenario:
> > > 1. The driver may obtain the initial value. If not, the value is 0. -=
--> This initial
> > > value called default value.
> > Lets just keep it current value in the spec and keep it simple.
> >=20
> > > 2. User query the coalescing parameters.  ---> Driver return the defa=
ult value.
> > > 3. dim is disabled from enabled state -> Driver restores the device u=
sing the
> > > default value obtained from the device.
> > >=20
> > Ok. looks fine to me as long as we keep it current value and say that t=
he device may have any non zero or zero notification coalescing parameters =
before VQ_SET is done.
> >=20
> > > Thanks.
> > >=20
> > > >
> > > > > Thanks.
> > > > >
> > > > > > I thought your intention was, the driver does not know what is =
the
> > > > > > best
> > > > > notification rate to configure and feature is enabled in the devi=
ce.
> > > > > > And the device does not have any good defaults (because driver =
is
> > > > > > not
> > > > > configuring any defaults).
> > > > > >
> > > > > > But here you say, the driver configures the drefault. I am lost=
. =E2=98=B9
> > > > > >
> > > > > > > >
> > > > > > > > > We assume that most users do not have the prerequisite
> > > > > > > > > knowledge to modify coalecing parameters.
> > > > > > > > >
> > > > > > > > Right. Hence the DIM should be used.
> > > > > > > > When DIM is not used, a non zero default is good to have.
> > > > > > > > (without forcing the driver to read it).
> > > > > > >
> > > > > > > +1
> > > > > > >
> > > > > > > Thanks.
> > > > > > >
> > > > > > > >
> > > > > > > > > Thanks.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Right?
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > Thanks.
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > +Regardless of whether the coalescing parameters
> > > > > > > > > > > > > +have been overridden by set commands from the
> > > > > > > > > VIRTIO_NET_CTRL_NOTF_COAL
> > > > > > > > > > > > > +class, upon
> > > > > > > > > > > > > disabling
> > > > > > > > > > > > > +and re-enabling a transmit or receive virtqueue,
> > > > > > > > > > > > > +the device MUST set the previous parameters for =
the
> > > virtqueue.
> > > > > > > > > > > > >
> > > > > > > > > > > > >  \paragraph{Device Statistics}\label{sec:Device
> > > > > > > > > > > > > Types / Network Device / Device Operation / Contr=
ol
> > > > > > > > > > > > > Virtqueue / Device Statistics}
> > > > > > > > > > > > >
> > > > > > > > > > > > > --
> > > > > > > > > > > > > 2.32.0.3.g01195cf9f
> > > > > > > > > > > >
> > > > > > > >
> > > > > >
> > > >
> >=20
>=20
