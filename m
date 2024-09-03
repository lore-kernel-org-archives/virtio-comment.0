Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0471B12EC
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361231; cv=none; b=RWnfhrMDnN3Jnocxpky8iVwtGsCZG4/IM1iO66N1bZ8jwer3XsovOxdE12KeL0UoIpuNG4Gt2sAd4QRPoNKD1WWLDmLQnvMtOK8t+wQ0HoFWiElc+6yoVaanceK0N9biwB1xcMQxTKX4+Rfn04Bv90CyQPCNg4PxJJxi8/kt+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361231; c=relaxed/simple;
	bh=at5KHDsgtFTRJIMVTb5aR5GmY2DDKHODPpRvJXnpON8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ts7nqgxv30a8GVuWNlRJbXUce8g1FaLZn8zLWM7ndQtT0kOZ94adBzBTXNGS2lIodBwLEDvs19TQJyJPL1LItc8nUHQDODgqDj7yv0xeBhrRktaPR5chrHvedI2P8lTn3zGUAYyx2EKbowmn19wiPQrWyzCceONikhE+s0bQXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzvRRkqF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzvRRkqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725361229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TVvB0j5EnuI9geuJpyn2V0kUTkKrhXW6Xlswrb160as=;
	b=hzvRRkqFReZiHD47L1eemoB1QKplTFRG1o6dQgtl9oG5e+UEGfTVk70f67FkjFJhnaTVFq
	zZZE0Z8+3NUwna3t/lXH2ZHR94GKEj8J/0wzVfiQkbSx9Bw5245ATY/atp6qTlRn622BWX
	bhjbYXpBLSSQrZ1mWaJD/yz6N2BMtBE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-ATWa_TsWMRya1oGphK_SUA-1; Tue, 03 Sep 2024 07:00:27 -0400
X-MC-Unique: ATWa_TsWMRya1oGphK_SUA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2f505e0c079so41237721fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 04:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361226; x=1725966026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVvB0j5EnuI9geuJpyn2V0kUTkKrhXW6Xlswrb160as=;
        b=sqvJKEVj8RaXHsjcUby3xc85c0aePgFYaT/23peNYxQI98Q//UeIiQhKuNrDZcG7eP
         x7q2A9DXT5Rfb11WPWxJsz5RYvmI/ulntSS+YpAZzScmuw7rmC8vyF9Kriq8Vj6PLCfl
         HEw3wEl9yGoWmVECzQMsZUZjezTm4Ud7fL5udjS4h6no/ldSUXjieyTTsOTtGcpCBFrM
         49lq+etEmiI7eLitWOCEq/ME2MkvInBkFP9I6LperSbgsVcKEp0+oqqJrhIUN1RbgM0j
         pbpaWmp+IdW7RSAKGf9+kRcVeHrPE8igOf1COxuEBkLxCMjDJe+Qy5pYuE9QdYYGPKrg
         UjeQ==
X-Gm-Message-State: AOJu0Yw/j+VvPBlqseR151vKh8bOE00l1wtvl1O1S9G48QA3FwcQjY/N
	1XpLq9ViET6I+2P1y3JOnz1VHHCHYh/m4seUy6Xkc1QlMB/WFe15EQN5k9SfI64413qA4HE1hLU
	HLz/FVy7LAXStkpqzx/c82oYA4sh4p9xWmauvi4VcBlH2KFmuoaIHyfobX934xHZp
X-Received: by 2002:a05:651c:b08:b0:2f3:e2fd:aede with SMTP id 38308e7fff4ca-2f61e0a50fdmr89926211fa.31.1725361226030;
        Tue, 03 Sep 2024 04:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdFGM3SWyMDx0PnpNQChBmXoRtyGkYLCqSDe6tQo95AMrUJYBmxfT1KTwH4VgodMlzH8WVRQ==
X-Received: by 2002:a05:651c:b08:b0:2f3:e2fd:aede with SMTP id 38308e7fff4ca-2f61e0a50fdmr89925641fa.31.1725361224977;
        Tue, 03 Sep 2024 04:00:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed1565sm21606111fa.6.2024.09.03.04.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:00:24 -0700 (PDT)
Date: Tue, 3 Sep 2024 07:00:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V10] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240903065922-mutt-send-email-mst@kernel.org>
References: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
 <20240903103815.pqjdjyedsqy3vr3y@vireshk-i7>
 <20240903065010-mutt-send-email-mst@kernel.org>
 <20240903105349.m3a36hmfq4ihje3b@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240903105349.m3a36hmfq4ihje3b@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 04:23:49PM +0530, Viresh Kumar wrote:
> On 03-09-24, 06:51, Michael S. Tsirkin wrote:
> > On Tue, Sep 03, 2024 at 04:08:15PM +0530, Viresh Kumar wrote:
> > > On 14-08-24, 20:27, Viresh Kumar wrote:
> > > > The current Virtio documentation lacks a set of generic requirements
> > > > applicable to all transports. Defining these generic requirements could
> > > > be beneficial when integrating support for a new transport.
> > > > 
> > > > This section outlines the essential requirements that any transport
> > > > method must adhere to.
> > > > 
> > > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > > ---
> > > > V9->V10:
> > > > - s/multiple// and s/employ/use/
> > > 
> > > Can we get this merged now please ?
> > > 
> > > -- 
> > 
> > 
> > You want us to start a vote then?
> 
> Yes please. Thanks.
> 
> -- 
> viresh


Sure. Pls follow this process:

https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues



