Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0916B392
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709404; cv=none; b=S2g3gBk0tKESYCDbiqxqtr+9fse4hy6cAquVqJLtQPp/SICzsVcMQyWEgN0hv1BGxpCD4RcIXq5Ppo9729buKXq3f3NQxxGDfQxJufj5vfp+42wVuWTeeoAtLD1Nioa9cciTGPwEz8kpg5IuBWArvyE0eHJMMRSpsn5+tZAdLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709404; c=relaxed/simple;
	bh=v1U4HMZWXsqcoeKTpmbundLoK21qdL6PRXUfAUdNj7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SCM2QTA8Hc4Oy/J22lAiQ9UAPAc6I1ilNS52LCc2uKSSGYYKb8FNH8jiDte2z1y+970yb+y6j9e29IFAkQR0RjRU5KYRotjyZi6oRDNcUTOulPYG0lqQ8udOEUJOpgnSwsfyp5pr92S+3CIRZJiTGtuJsfEISSRKZQSiZfp9c8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C/icdG3/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C/icdG3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720709401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecMjA7+ENJYOvCiqY5ibP598+QAe/1jdxCNjOh+PkM0=;
	b=C/icdG3/fboOD4d5aH5NfkI0uOdgf8/RGPzuqVfIFMKbg8uqqWC7ksNjtK60tSypnrWENM
	rBg6ZU0jomFe32+5UenGnhu3t9da46735biw0bsrLdeHqE+XueXqGnZ2TSGkmCL3vW3sgK
	FPDfHFrS4RmUnY2bajhJJ1YV+38rPuM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-atpTKIOBM5K4K0thcGs8pQ-1; Thu, 11 Jul 2024 10:49:59 -0400
X-MC-Unique: atpTKIOBM5K4K0thcGs8pQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367f1dc92e3so501558f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 07:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720709399; x=1721314199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecMjA7+ENJYOvCiqY5ibP598+QAe/1jdxCNjOh+PkM0=;
        b=cyC0wci81KpZj3XgZrC4oYEe6ZmFyxk7YdWO+eqJxyag8W3j4YsKwIrEK5453F4LOj
         t2AwUvIMnkH1QgnEbyTr7qT9ipIpIzO7AsuDZmfFQTNDLdVNn/NAXZz7Wj5Lp4mIviZx
         r6/v/TX8dYPSlVbPgtahuQbim7TwijEI68adLV3OSRP8d2N2V95HAa9DZH8dqCRIawTB
         AmLtTGNeEo/WJ6DV0K+b3DUX9hFzkG89/tWKZs32cXnk8/LYaF3cJDz+8ZIVYMkrJbbo
         ru/xQZXIcGlA8T8zXddnof2c76j0VsrmjhmCTL/qdyoSaJd+nKVuQLlbHkJWxAh2SI89
         RIPw==
X-Forwarded-Encrypted: i=1; AJvYcCXFS+lm82EOHWjVNEMTz3Zn3hamaWuhvGRj/bog0fCTnSFeG632/jHjYJTF8q1ASj+kQhYzDkIeK6LYaqSp2H2+rXjJ4KQUlkOQB+lHPDg=
X-Gm-Message-State: AOJu0YzRTZzX0I43VFCSp6IQ0xQeYPO7avksWUMG26Vwe7LWQYtcJaCE
	BHyAWlchWTLCErBIexEO4gC86bOTfQ0zhqtYquCRFMjxvLHcz3Zz5itSNNgvR7HhzC7q2lzpWeL
	hzJku4hU7useE2x9U5sSwBO/lr8aA0kH6/T+OI1zV27y515FEcdehHiAg/zAU1Vs/
X-Received: by 2002:a05:6000:1046:b0:367:9088:fecc with SMTP id ffacd0b85a97d-367cea467b2mr6218139f8f.7.1720709398912;
        Thu, 11 Jul 2024 07:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH11gYps0I7VhprMpVMTP9Ye+qA9iuqbgyKHPKe+q4fGt0p9c5EyfcsIY9CXNmAd9QB7YrEtw==
X-Received: by 2002:a05:6000:1046:b0:367:9088:fecc with SMTP id ffacd0b85a97d-367cea467b2mr6218120f8f.7.1720709398377;
        Thu, 11 Jul 2024 07:49:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab6d3sm7825796f8f.112.2024.07.11.07.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 07:49:57 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:49:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711104702-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240711070740-mutt-send-email-mst@kernel.org>
 <87zfqob184.fsf@redhat.com>
 <20240711074942-mutt-send-email-mst@kernel.org>
 <87wmlsb0m1.fsf@redhat.com>
 <20240711103014-mutt-send-email-mst@kernel.org>
 <87ttgwasyg.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ttgwasyg.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 04:44:55PM +0200, Cornelia Huck wrote:
> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Jul 11, 2024 at 01:59:34PM +0200, Cornelia Huck wrote:
> >> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> 
> >> > On Thu, Jul 11, 2024 at 01:46:19PM +0200, Cornelia Huck wrote:
> >> >> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> >> 
> >> >> > On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
> >> >> >> The virtio documentation currently doesn't define any generic
> >> >> >> requirements that are applicable to all transports. They can be useful
> >> >> >> while adding support for a new transport.
> >> >> >> 
> >> >> >> This commit tries to define the same under a new Appendix section.
> >> >> >> 
> >> >> >> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> >> >> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >> >> >> ---
> >> >> >
> >> >> > I am not sure what is this supposed doing - just listing basic things
> >> >> > transport does or all things it can do?
> >> >> >
> >> >> > If the later, this ignores several things that transports can do,
> >> >> > such as shared memory, data in notification, etc.
> >> >> 
> >> >> Maybe split this up?
> >> >> 
> >> >> A transport needs to implement the following:
> >> >> <list of mandatory things>
> >> >> 
> >> >> A transport is encouraged to implement the following:
> >> >> <list of non-mandatory, but strongly suggested things>
> >> >
> >> > Some things just depend on feature bits, and a transport
> >> > can make a feature bit mandatory if it wants to.
> >> 
> >> I wasn't thinking about mandatory for a device/driver, but mandatory for
> >> a transport (e.g. stuff like per-queue reset which is not mandatory for
> >> a transport to implement.)
> >
> > Same thing really.
> > For example, queue reset is controlled by VIRTIO_F_RING_RESET
> 
> Well, it is -- but a transport can choose not to implement the feature
> bit. I guess what I'd like to do is to set expectations: every transport
> needs e.g. some way to do notifications, but it can skip some other
> things like "device discovery", for example. I think the appendix is
> intended as a reference for someone wanting to design a transport, and
> some kind of laundry list would help there.

Yes. I am however a little worried that if we include optional features
we have just increased the cost of adding any new transport feature -
it now has to be added in this appendix, too.

So maybe stick to just the basics? WDYT?

-- 
MST

