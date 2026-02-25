Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001FD3D667C
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032294; cv=none; b=Av6/B2tNecJ6bDw6bzRA6kdvaUFwF/aG55K4v+9+CJWIOBXpIiBCIAL/GsEojc3BJQrQ1jHUHL3y4CPBKK3OYnbHi8Hy+w5PcDIPS8y27Q2eifL4avBpbHwTCoCrHUGLXwF/RxQ8leJMHLonio5CoVXGb6QwtuyX0djVwYmhKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032294; c=relaxed/simple;
	bh=bGuhyUD5deMAnj67hVDuO0KuZ6EtDXqkGUYWJ8EitMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7VOm9v193O99aroNlpzYkWnoWKl2VW1v/1A9BFPlTaNJbK3cBpY9lC9OzKjIMI89UAre5PtHn3a8TMEQHvcBQYJHZI8vVDw+91OgQpb+9eQYyvPC9wfuEK2Ikm4Ia7brKoVbgp8SyilaeSC7mh/pr1Yz9e2hLG4toOXKMEZw9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovgk5dSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovgk5dSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC10C19421;
	Wed, 25 Feb 2026 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772032293;
	bh=bGuhyUD5deMAnj67hVDuO0KuZ6EtDXqkGUYWJ8EitMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovgk5dSU7gYGUUwsNTAlixZLL/yylzKDoVTSMECbmmxvwm9v+ElBMJns+UKIoQpkF
	 i5/cP4JKdP5OEJPdoCXlAofeg74XJwlOHvPiEzQN8WZ4nQakICai3Za2YfJDM2za4O
	 S1MhdHYlB8fAfkHj1gAqulNpgGCoIsLxbAhR/eas+uIERKD0Vo6xLYR2F6vI2/83EC
	 SIeCjc4BzLJkIk4rtMsgaw6BM1Hr3/mKWZEqkuAghW2zZ3t7l9h6G9opJg7aYmOUZo
	 LsYxZsQNKdLQLIJR2cbRUe7+3H7XWbLmJOlht7zbXUyzQi0PjKVkos0iHfUfzPLnKn
	 jt6A5h3k6cCXg==
Date: Wed, 25 Feb 2026 20:41:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Parav Pandit <parav@nvidia.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
References: <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>

On Wed, Feb 25, 2026 at 03:00:19PM +0000, Parav Pandit wrote:

[...]

> > >> Yes. This makes a lot of sense now.
> > >>
> > >> This is a virtio-msg-transport device that needs its own device id in the table.
> > >> And its binding to the PCI transport.
> > >
> > > ok. how about an rfc of that idea on the list?
> > 
> > 
> > I will let Edgar answer on this.
> > 
> Sure.
> Also please explain how is this different than SR-IOV devices?
> On a PCI device there are some child devices exposed using some virtio-msg bus transport.
> And all of them are going to share same PCI BDF.
> These individual devices cannot be mapped to different VMs (secure or regular) in a performant way either.
> So what would this virtio-msg-transport device achieve?
> 

IDK why you are comparing this transport with SR-IOV, which altogether serves a
different purpose.

> If there was no PCI bus when implementing the virtio-msg transport, it would make sense to avoid trap-emulate story.
> But underlying transport being PCI, its back to square one for the originally described motivation.
> 

Even with PCI as the physical bus, we don't need any trap and emulate assumption
with this transport, because the communication is message based, not writing and
reading registers directly in the BAR memory.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
