Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C1407567
	for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 18:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635975; cv=none; b=p09fSlRwQZkSxG/TDVRW8GYgPQNDMmtOnqOONSyqVuCKR5BG6SQpIG5+69Z0kfynOLOFErY/j/wmF3MhQt9dXVq4zUZ+TVW/24qXm+bjBNi0k9Ga6d48Sm3dG71IYJa59KOCUkeEJ56B3QqRL0/W+TXXiB99PP9trta6l7YZXVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635975; c=relaxed/simple;
	bh=pCE4CHnc8XKw4EYHIKsOgxsQoVqBjgz4P16DMMdD7Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZRnJEX2o8GTV562/abrae3ZEhW2QHtBjQIY0V/lv5souBFTRypcQYNbMmphg3Ivmt7W8YLxMlyCQlasCOiEw1vhsotT6Mwwl9MhAOjLFG2mkQuUpWVRwhMBlmCFb4sK09xFsa0X0FDhyxl5PqB34nurqQCpCyen4Fv6yBJsLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWnXbTHC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NI4nmvP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWnXbTHC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NI4nmvP9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2kfw083298
	for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 18:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/p2oaglIbmlHj3Ob+L4Bd5Gd
	Gv8zPvkmwM2fMOwO6Z0=; b=UWnXbTHCNCcQy+zu/6uc2G+8UgYrO4ipTu1NazWe
	1oXHTWfT6O4Yf28ySov1/Yp9N+3p1porayUU3uDCPeDQAGPMP1ujbUwwUrJzlWny
	ggIb6A1zwc6k2BWyczsfRMdNmsSgsci4EmhbckXrttuP1QaLoljIDx472u0GFvvG
	w4E6cDmE4kPWPVVt9Jy/dvQZzVYdGuIo0DTHs3sXk5pJdF6CRC+ldTHhFtfdToB3
	jPhigeyoNFSwUKKalqiQ+cuUEocTs1+wnzfr539J1M8kt89fc8kOjjd+jE+cb888
	zOgE4eV0amvkD9vPSpzS2YfaNcyOX3FilAF3d+RANpOFeg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx324a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 18:26:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso113325751cf.0
        for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774635963; x=1775240763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/p2oaglIbmlHj3Ob+L4Bd5GdGv8zPvkmwM2fMOwO6Z0=;
        b=NI4nmvP9sJ0gZvw4/heSq1rYoxzCjhc7QQpgyAGFO27Sa9P5S7a4xDRd4pyES1b67x
         AhcSbSw+2zBftxZV+O5bUgfi23GoIVjz9Hqo6oN1wbJ3whk2/eJaoV/efsJxFVCoW0s2
         uWq330av7zlMS4RDv3VmTgArFm2DRL0SVUBrTb7TvmAi5nXtZvdig5Z89GFMaCZdyd+P
         jHu3pV+Fwgd/YINPBayjklhaRHvCcn3SaSGLpxQ7d3f5YmdcH+lgWmOUwXQsQx4YSeBE
         s1O/GiKH582/2deWVeY0QiGErc/W3Yl/YW4XA21r/GjMrTAA0L4P4Wl/S3n8W//BCR0F
         Fmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774635963; x=1775240763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p2oaglIbmlHj3Ob+L4Bd5GdGv8zPvkmwM2fMOwO6Z0=;
        b=X44gdPlwQzQKKjEJq4p2dvxGip4XwLa/EJQq6LzdQakQJou3NulnpkGPBfNIBzrm9M
         q9VvBkb28gNvKuT8vhwyEhLAhFhV4ThiNng/fcfmPsfplqynhDqA9UgbpnmFe1LQK3Qs
         7+gFqjL1lBUfW3bleBRmJqh2O7CiZMpsHvIJSnBhl01L2KBmV/KdW2PzeGWRCVG9k8nH
         WUIfiURl5mmvlkhXldZ5Nss1qTbEWHHn9h0U2KWBgMMK4NG1z+Cu9SV9VJU1yuyFWdS3
         BGv5Ma7t4fRtbGxTHaBsDa4dN6yTrjVPe+CDed9syPRIjmH+5l5hgjqsm8TCz+88Spx+
         1GNg==
X-Gm-Message-State: AOJu0YyGUJgIyYKgO9tG4W1t09VZHxxmBur0innkO3EZK7hyqvyHQqOL
	6kX49BREqzReB4ocCSVw+rtzywkI5/4qqm3Wz1QjnCBJvMaKhDXhAJdUcMpXK7KuHjVuA6EkDDj
	rozplDPYWgV8ECTjcUkzj/HBV7lRKBbJiiEhERB1FKuUuP4UkdcTw2xwtNpIiwlHJlXfORA==
X-Gm-Gg: ATEYQzzk8ypYWmpjMQlp28dnfi886NIzpAutDA3T6rQqOlRuGevsg16/ZHOk6b95QLv
	O8l6qjgIKcUcXxZN/dOp6325syvQ4ocMc6C/rbqc2GlqoQCEmeWrLKBQhlSh01Osj/jHn3apU2M
	WczGo7H0fTk4Rv82Mmy7QTo6ybXXQeOkp8+AXEHtLbhxAMDleNTorIYWmXpkH5dcKhDOLrSt5wh
	PKHzBlDGC1dQRXixZvePAUUgYMuEbe9k6Tf6tqnsIea0uBsrZ/GDHM1+lKhDXXKpPrVCnbe5BxA
	s30sMGnEA9uJwZPtPaBpnwR8f+mmTNma7csPnOUKv4fpbjnV2Gug+7svwd+5Mq2TY442un4YzdK
	BSh7FzlaipL4kceHF/snIdKOaapBd4eNUJV8fX9iF0suiXrKf7TuJBGsZ
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr80566211cf.10.1774635963177;
        Fri, 27 Mar 2026 11:26:03 -0700 (PDT)
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr80565691cf.10.1774635962634;
        Fri, 27 Mar 2026 11:26:02 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e4395sm1191966b.44.2026.03.27.11.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 11:26:01 -0700 (PDT)
Date: Fri, 27 Mar 2026 19:26:00 +0100
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] transport-mmio: Add v3, which polls for reset
 completion
Message-ID: <j7ahfplk4vviarn5xtyvafouzeku2s3t5troozuogyshzu2ok3@jldbh5fxwu36>
References: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
 <20260204115022.1930-2-peter.hilber@oss.qualcomm.com>
 <acV+cZ3jvru8BzIY@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acV+cZ3jvru8BzIY@fedora>
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6cbbb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IwjJgLCN95oIc_OHlqIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _wr1wqj8_LwgBPag62FmEsOM5c6QL7Jm
X-Proofpoint-ORIG-GUID: _wr1wqj8_LwgBPag62FmEsOM5c6QL7Jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyOCBTYWx0ZWRfX7udeoKG4nT9t
 Za0sSvqTIB/jAJEAMAWlkPJ6TgdPp7XLJdcKjrsshjBsjlpl4fPRpxxQTXILceBtoTracSPsXWk
 vCbJPaw4bDz273V6KT+M7FUU53zdOkdCrzTlu5PjT0EvegPHvQl35C5utRcJNw1AmdYOi0dUZRz
 QJm6RV591BZgtPPaeHh9wkAlO0D7drDXOg8Hk2XN8/HMF5KfBy9mVQvQl+GTmwe80QsMD2bMlVf
 VXcK2/XQnV69ffzSAQlHjfaNriFAkIlLdeVZD4uxxJWspExWNZqx7Jmk569oApte+0Vs5u4KDZW
 5stpVuG+zd+v4PhAAAvqvf+UA5qIMuh+s0dbvvEO8p+DdlndtTULwIQXqTbZB8GeIgrwvfko6pG
 juSoNxQr75WbZK/J3eQR437kXUNpsodnMFHVjLsmQbZMFi8QETvA8Hu69kXLBZlT+LB8439Hsau
 dmN4foM0iNCfR5Za3fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270128

On Thu, Mar 26, 2026 at 07:44:01PM +0100, Matias Ezequiel Vara Larsen wrote:
> Hello Peter and sorry for the delay,
> 
> I used Claude to review it and I added some comments below:
> 
> On Wed, Feb 04, 2026 at 12:50:22PM +0100, Peter Hilber wrote:
> > Let devices using the MMIO transport avoid stalling the driver (virtual)
> > CPU during device reset, which requires introducing a new MMIO transport
> > version.
> > 
> > Unlike the PCI transport, the MMIO transport does not require the driver
> > to poll for reset completion. This requires a device using the MMIO
> > transport to complete reset during the write of 0 to the Status
> > register. Device reset may take more than 100 ms if it involves
> > terminating ongoing device activity which accesses driver memory. When
> > the (virtual) CPU writing 0 to the Status register needs to be stalled
> > during this, this may violate real-time requirements (including those
> > for hypervisor trap-and-emulate).
> > 
> > Address this by introducing a new MMIO transport version, v3, where the
> > driver must poll for reset completion, and, hence, the device reset does
> > not have to complete during the write to the Status register.
> > 
> > For clarity, also add some related requirements for v2. These
> > requirements are implied by the rest of the specification and therefore
> > do not alter the v2 semantics.
> > 
> > With MMIO transport v3, reset essentially works as with the PCI
> > transport, and the change is therefore not expected to cause problems.
> > 
> > Existing devices with MMIO transport v2 are not required to implement
> > v3, which will not work with current drivers. Drivers have to support
> > the MMIO transport versions of the used devices. Portable MMIO transport
> > drivers should therefore support both v2 and v3, which is simple.
> > 
> > Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> > ---
> >  transport-mmio.tex | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/transport-mmio.tex b/transport-mmio.tex
> > index 94a93a1..6504a6b 100644
> > --- a/transport-mmio.tex
> > +++ b/transport-mmio.tex
> > @@ -64,7 +64,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
> >    }
> >    \hline
> >    \mmioreg{Version}{Device version number}{0x004}{R}{%
> > -    0x2.
> > +    0x2 or 0x3. With version 0x3, the driver waits until it reads 0 from the
> > +    \field{Status} register before considering a reset complete.
> 
> Shall we add something in the Status register too?,e.g., the driver may
> or may not block when writing to this register. 
> 

Agreed. How about adding this?

	Starting with \field{Version} 0x3, writing zero may not take
	effect immediately, and the driver waits until it reads back
	zero before considering a reset complete.


> >      \begin{note}
> >        Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}) used 0x1.
> >      \end{note}
> > @@ -262,13 +263,29 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
> >  
> >  The device MUST return 0x74726976 in \field{MagicValue}.
> >  
> > -The device MUST return value 0x2 in \field{Version}.
> > +The device MUST return value 0x2 or 0x3 in \field{Version}.
> >  
> >  The device MUST present each event by setting the corresponding bit in \field{InterruptStatus} from the
> >  moment it takes place, until the driver acknowledges the interrupt
> >  by writing a corresponding bit mask to the \field{InterruptACK} register.  Bits which
> >  do not represent events which took place MUST be zero.
> >  
> > +The device MUST reset when 0 is written to \field{Status}.
> > +
> > +While a reset is in progress, the device MUST retain the previous value of
> > +\field{Status}.
> 
> I think this may be inconsistent with the `Device Status` section:
> 
> `The \field{device status} field starts out as 0, and is reinitialized to 0 by
> the device during reset.`
> 
> I think we could change in this sentence the word `during` by `after`.
> This is a minor comment though because in v2 `during` and `after` is the
> same from driver pov due to the sync semantics.
> 

The `Device Status` section applies to all transports.  Would this not
change allowed behavior?  Maybe it would be better to add the MMIO
requirement only for MMIO v3 and in this different form?

	For \field{Version} 0x3, the device MUST change \field{Status}
	to 0 as the last step of the reset.

> > +
> > +For \field{Version} 0x2, the device MUST finish a reset before the driver's
> > +write of 0 to \field{Status} has completed.
> > +
> > +For \field{Version} 0x3, the device MAY continue with a reset after the driver's
> > +write of 0 to \field{Status} has completed.
> > +
> > +For \field{Version} 0x3, when \field{Status} is 0, the device MUST ignore
> > +further writes of 0 to \field{Status}.
> > +
> 
> Is this coherent with PCI? I guess the idea is to ignore if the reset is
> in progress but in that case status is not zero yet.
> 
> 

The intent for this requirement is to avoid ambiguity about when a reset
would complete when status is already zero. The following should not
happen:

  DRIVER                          DEVICE

  wr(Status, 0)
                                  reset starts
                                  reset completes
                                  Status = 0

  rd(Status) -> 0

  wr(Status, 0)                   [second reset triggered]
                                  reset starts

  rd(Status) -> 0                 [!] reset still in progress

  read MagicValue, Version, DeviceID

  wr(Status, ACKNOWLEDGE)
                                  reset completes late
                                  Status = 0  [!] clobbers ACKNOWLEDGE

Thank you for the review!

Peter

> > +The device MUST present 0 in \field{Status} once it has finished the reset.
> > +
> >  Upon reset, the device MUST clear all bits in \field{InterruptStatus} and ready bits in the
> >  \field{QueueReady} register for all queues in the device.
> >  
> > @@ -305,7 +322,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
> >  The driver MUST ignore a device with \field{MagicValue} which is not 0x74726976,
> >  although it MAY report an error.
> >  
> > -The driver MUST ignore a device with \field{Version} which is not 0x2,
> > +The driver MUST ignore a device whose \field{Version} is neither 0x2 nor 0x3,
> >  although it MAY report an error.
> >  
> >  The driver MUST ignore a device with \field{DeviceID} 0x0,
> > @@ -331,6 +348,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
> >  The driver MUST write a value with a bit mask describing events it handled into \field{InterruptACK} when
> >  it finishes handling an interrupt and MUST NOT set any of the undefined bits in the value.
> >  
> > +For \field{Version} 0x3, the driver MUST NOT consider a reset complete before
> > +reading back 0 in \field{Status}.
> > +
> >  If VIRTIO_F_RING_RESET has been negotiated, after the driver writes 1 to
> >  \field{QueueReset} to reset the queue, the driver MUST NOT consider queue
> >  reset to be complete until it reads back 0 in \field{QueueReset}. The driver
> > -- 
> > 2.43.0
> > 
> > 
> 
