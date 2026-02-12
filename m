Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646F29D29E
	for <virtio-comment@lists.linux.dev>; Thu, 12 Feb 2026 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895017; cv=none; b=lCHzgzG7Ss83h+EYR8sBV62kLPGZ2BX2Ph/b4GYetevr4AEKStKrS1vSDAbXQSgQxQKkyvpUjfO6rrlcKdFyGQAusno1WXdrX/hPosECBpNw8M5reG8Xls6rzgkganFGDDF1z4NeKK5BMWTLX9RLL3tTDlu1Ar5uHGzqHFG0PIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895017; c=relaxed/simple;
	bh=Aes3fUAE4RMd2Pd3WOY/TxRSvZCCFEM8iM4f5Q8TCz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYOu/th1GQzflJDu966K9lb/7/GKQ/KakpdBDOXY+jV99C7A553+8bRG91slU3GKjyzGBDJve8H/aX2o5KWKTd1SQEA940TcQtdej4E5GFNOb5HTGZQWjPGH7k2qhbfX3iw3ZzTfEte2/GqTjoJktBFCqRIBldd92h7WZxsNJ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBy+GySh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQGA6iYq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBy+GySh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQGA6iYq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAIJsF657795
	for <virtio-comment@lists.linux.dev>; Thu, 12 Feb 2026 11:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNUPW18b1Oxe9QoeGUxqzjITj/5rBIvR3Oh84eZCz6Y=; b=ZBy+GyShxGUuVc9O
	jDQ79oMvXAW3S01dXVaQ46FjCYEM8vu+AoQqoNfG6qHE1unHLjfqp1Ruft24hsrU
	TwID7dhSghyfUnOXzaae6D3O6pwKDTltf4OxmjIEqVPF+qD8sfAf/8Xi+vr1oFuJ
	TyUgCMqIs9Gn2ZHzbksz3UnPnoqjKCCpykYOGfecUf/F0NnZCVbnofjl8Hp1s+e1
	YjmucwmJ60Yeg2cKdz3KwaGGUO/0eeuZOQQDsJ9eWW9REUF3Eoy+q4r2VJTCjDVB
	KTsMsuPI4JMLMY0IlhpAwMb8OQNmDrtIPzfnAQXLyMlGxreRT/gYZDLH0OCTeMhh
	+3S6gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09g5mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 12 Feb 2026 11:16:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a08daf3so799805785a.3
        for <virtio-comment@lists.linux.dev>; Thu, 12 Feb 2026 03:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770895014; x=1771499814; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNUPW18b1Oxe9QoeGUxqzjITj/5rBIvR3Oh84eZCz6Y=;
        b=IQGA6iYqJRil0bXP6nz2kfyJJro2JO+HgDyrumytanvU4AU8Ck3ae486/OstgztfU2
         b6HyXOJXWhXEYFyyoEMDyWsF8GxkG1/6aHaXVXkNxBoYddPpjVAd+lViLuMuHd8duGmY
         C9Wdzge/V+rpzwSQGEh3BjTbeD4pMPfZJaqWRTdnUNyyOYwgV3klrAmWiVWMRue/dCC1
         EO/7GVkXKZH3gKBsOKO1Vqj+8QtMFxm2ZJqcml7g5hSMfIy/ag02EjR8JUfgHefsAcd1
         11k5f3+a/OdhboIIYSSHwkDdSJRGleBIMguzlr6FzWbZ5B/UPYJJj4ZWHeun/kmS0LGQ
         hXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895014; x=1771499814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNUPW18b1Oxe9QoeGUxqzjITj/5rBIvR3Oh84eZCz6Y=;
        b=j0NZNopb2dAooX5WIR0nw0N2smrGkcT1wM3fch5NHy7JPWRRrRyoAlKyXEIvLwrIRx
         iH5mrEueHkrliQrtn7MUdj2I6QIGI1lWU4/LVVJh1hxLTt7LBProykXXalHW35wk9Acc
         ZZuC0i5IU3lgAFat854SHf/dJ1L2IEgBlzHL2z7q/1t5ZjO1wW2qSJpCFer5m/DrDN8K
         by+chn/3ZvAost9eBpEndkEGoH1fhgCaS8JXwRtKs1dLAHPM8Q3rbmqA1ZgXrAWnUInj
         nXVB4pJCpHORKulde3WjFuc8SxJTIJL0oDclcwcCqPffQeuxqOOsM45ggaE7oHg4CG3i
         2h8g==
X-Forwarded-Encrypted: i=1; AJvYcCWrnT2bQxpBBpG8tO7sVVql6Ci8p0Cz6Gi8qqpiIK4rvgshO0PgdKPHr3jLJfuj1zvseoSezJuMi+FQoFqD5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOv1+lVLGXzUb4qD5PYCywnM5nqYQpya//VJz6HPT+0WQlw6R6
	A4WLvZIiDpCDTwo2F8djknkSah2CS9lA5cX63uBIiQ8uGM6Lr1baLd19jaeiL4bc62F4VJ8wa19
	FnFONyOty7rUnx7ZDym7NQyebB5EGM1eSK1e8rj7TqOFW4wDMnKSWwlNDArq3solkfFIUpA==
X-Gm-Gg: AZuq6aJ9hePYi217KjBPKEO8uOIZEyOJYv4cGJiclYy3BSAEyIqYDGsFYm9sE4mTxX/
	tgCYIKJwoDiDTmCR4l0Rolj0aCZhH/ZA81q8BQPmgSw/1gcxs2HZ9Ok9XiUvUtGwoq7IywVtFHa
	y57qke15lX0FxkvMPcCsf0v8U8WfUaidvp4hDdWY24tso1VQ5NRE3gPkKTX28aTc9V2ZF9uBL4P
	WGs+FdYFeQNcn7vyW06gA0tAwRKEvcNe1ZcobnT41eIT2SuyHk177uznEtxmN3jh+1UAB+IlXkz
	q4dwvqWnCcY2PaVE20b6RvXPjF6JEarKg9z8XwOtMFA+6XZMDzNoInVqgRB4pylU6OwOiUhsU7Z
	He8okTbKrOScI7VcDtdE7Kkol4Y5TUlS38M1vnoMcqjLxW7p+mIITK/rh
X-Received: by 2002:a05:620a:480a:b0:8b2:f0be:27e4 with SMTP id af79cd13be357-8cb3505ab86mr185748285a.18.1770895014235;
        Thu, 12 Feb 2026 03:16:54 -0800 (PST)
X-Received: by 2002:a05:620a:480a:b0:8b2:f0be:27e4 with SMTP id af79cd13be357-8cb3505ab86mr185744485a.18.1770895013555;
        Thu, 12 Feb 2026 03:16:53 -0800 (PST)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f83e1a853sm106623166b.19.2026.02.12.03.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:16:53 -0800 (PST)
Date: Thu, 12 Feb 2026 12:16:52 +0100
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Alex Bennee <alex.bennee@linaro.org>,
        Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Message-ID: <c2722ggmzqog6fgi63yiaxqzuwomivvkfzdcdwuty6emaxx4sr@4mwch42anuxg>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <k6a7me4yaf372lllkyy3hgm2rsjxtzbmyptqp3ebko7z7znah2@3zwgt46i3nbo>
 <C3D17D89-EBE8-490D-9A2C-09641C7125CE@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C3D17D89-EBE8-490D-9A2C-09641C7125CE@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4NCBTYWx0ZWRfX3yrVP4qYIlLI
 FZ2kT7tkXdqk0BcAVN6UtSp4F5hqw/3ik+OchdeMR4jgsf+EM8CJVuD/040xtARlrVAJD7l67Ah
 yXIuZ7XVs6IOc4vKgdDmTPpZKnqQ1lmP/POB7wXulxu5gkZMmSKmF4gdKBy3cEUtGqqL12aqUJB
 dU0h6wQkR4dloNJ03HHSQA3kTakM/LAgirFdFXjMG4PS8pm/t8tc2ZNa0WxJcdlP4/jevo+bMP8
 OvaKgSCzcjH70U8umvyML4mV0qqjftx+VzkMhsgXx3XjxbRDfi05agRpeR4MzkkQoJ/IhbzolMl
 lg9kfZmgMwUg0EfLcfNr8K5z9zPrnW8ODZ1UbQCDPqRU7T6w0bvVluTA8U5vIejQaYMEevpXB6K
 sSRgjTtM4Z5HDrisFqSPK4RetvruQWJp39GcBDcn8KfyoZVNMJYfrjKa3Ybn5woG9M8yY28Bm0e
 2ewyToSk2B1ULsaXNyw==
X-Proofpoint-GUID: qZvxOvefWWYF_Rq483Yzwy2XT1nrXrPP
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698db6a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=m8S-l10vJDNwexCprqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qZvxOvefWWYF_Rq483Yzwy2XT1nrXrPP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120084

On Tue, Feb 10, 2026 at 09:39:09AM +0000, Bertrand Marquis wrote:
> Hi Peter,
> 

Hi Bertrand,

thank you for the fast response! I added replies where I think they are
relevant. I also added a few new comments.

Best regards,

Peter

> > On 6 Feb 2026, at 17:28, Peter Hilber <peter.hilber@oss.qualcomm.com> wrote:
> >
> > On Mon, Jan 26, 2026 at 11:32:28AM -0500, Bill Mills wrote:

[...]

> >> +\busnormative{\paragraph}{Revision Compatibility}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Versioning and Forward Compatibility / Bus}
> >> +\begin{itemize}
> >> +  \item A bus instance that advertises transport revision $N$ MUST satisfy every
> >> +        bus requirement defined for revisions $1$ through $N$.
> >
> > Are transport feature bits supposed to be negotiated? I think this could
> > make sense so that behavior can change without affecting
> > interoperability between implementations of different revisions of the
> > Virtio standard.
> 
> Yes transport feature bits are supposed to be negotiated.
> It is expected that the bus will determine what is the common set
> of features supported and will only declare those to the transport.
> 
> A simple bus implementation could just get from the device side the
> mask of bits supported and mask it with the list of features bits supported
> on the driver side and give back the common denominator to the transport
> so that only features supported by both sides are advertised and used.
> 
> We will make that clearer in v2 if you agree with that principle.
> 

Ack.

> >
> >> +  \item If a bus instance cannot forward a message because it requires an
> >> +        unsupported revision or transport feature, it MUST surface a transport
> >> +        error or drop the message without forwarding it.
> >> +\end{itemize}
> >> +
> >> +\subsubsection{Device Numbers and Enumeration}
> >> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts /
> >> +Device Numbers}
> >> +
> >> +Each virtio-msg bus instance contains one or more \emph{devices}, identified

According to a statement above, an instance can also have zero devices.

> >> +by a 16-bit \textbf{device number}. Buses discover these device numbers through
> >> +mechanisms such as:
> >> +\begin{itemize}
> >> +  \item \textbf{Message-Based Enumeration}: Using \busref{GET_DEVICES} to query
> >> +        which numbers exist (optional).
> >> +  \item \textbf{Platform Data}: A device tree, ACPI tables, or hypervisor calls
> >> +        might inform the bus of available device numbers and their properties.
> >> +\end{itemize}
> >> +
> >> +Once a bus confirms that a device number is valid—regardless of the discovery
> >> +method—it normally issues \msgref{GET_DEVICE_INFO} to retrieve the device and
> >> +vendor IDs before registering the device with the host OS so the usual Virtio
> >> +driver binding process can begin.
> >> +
> >> +\busnormative{\paragraph}{Device Number Assignment}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Device Numbers / Assignment}
> >> +\begin{itemize}
> >> +  \item A bus implementation MUST assign a unique device number to every
> >> +        device on a given bus instance and MUST NOT forward transport messages
> >> +        for a device number that has not been validated.

An additional requirement could be added to limit the reuse of a device
number after the device has disappeared, in order to avoid race
conditions.

> >> +  \item A bus implementation SHOULD provide the driver with sufficient
> >> +        information—either via \busref{GET_DEVICES} or equivalent platform
> >> +        data—to discover each valid device number.
> >> +\end{itemize}
> >> +

[...]

> >> +\busnormative{\paragraph}{Error Handling}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Bus}
> >> +\begin{itemize}
> >> +  \item A bus implementation MAY report a transport-visible failure (for
> >> +        example, after exhausting a bounded retry policy) when it cannot deliver
> >> +        a request or obtain a response.
> >> +  \item A bus implementation MUST treat malformed headers or unsupported
> >> +        \field{msg_id} values as invalid, MUST discard them without generating
> >> +        additional protocol traffic, and MAY log the condition for diagnostics.

The bus does not have to understand transport messages, so does it have
to recognize all unsupported msg_id values?

> >> +  \item A bus implementation MUST NOT generate error responses to event
> >> +        (one-way) messages.
> >> +\end{itemize}
> >> +
> >> +\devicenormative{\paragraph}{Error Handling}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Error Signaling / Device}
> >> +\begin{itemize}
> >> +  \item A device receiving a malformed or unsupported transport message MUST
> >> +        discard it without producing further protocol traffic.
> >> +  \item Recovery actions taken in response to an error (such as retries,
> >> +        selective resets, or device removal) MUST follow the normative reset and
> >> +        status semantics defined in
> >> +        \ref{sec:Virtio Transport Options / Virtio Over Messages / Device Operation}.
> >> +\end{itemize}
> >> +
> >> +This specification does not define a dedicated error-reporting message; it only
> >> +permits implementations to surface failures when silent recovery is not
> >> +feasible.
> >> +

[...]

> >> +\drivernormative{\paragraph}{Initialization Flow}{Virtio Transport Options / Virtio Over Messages / Device Initialization / Overview / Driver}
> >> +\begin{itemize}
> >> +  \item A driver MUST issue \msgref{GET_DEVICE_INFO} before attempting feature
> >> +        negotiation or queue setup.
> >> +  \item A driver MUST complete feature negotiation via
> >> +        \msgref{GET_DEVICE_FEATURES}/\msgref{SET_DRIVER_FEATURES}
> >> +        and confirm the FEATURES\_OK state via \msgref{SET_DEVICE_STATUS} before
> >> +        enabling virtqueues.
> >> +  \item A driver MUST configure each virtqueue via \msgref{SET_VQUEUE} and
> >> +        confirm its parameters (e.g., with \msgref{GET_VQUEUE}) before marking
> >> +        the queue ready for I/O.

The Linux kernel driver mentioned in the cover letter currently doesn't
confirm using GET_VQUEUE. But if SET_VQUEUE would return whether the
queue is enabled, as was discussed below, the driver would only need to
check whether the queue was successfully enabled.

> >> +  \item A driver MUST drive the device status transitions using
> >> +        \msgref{SET_DEVICE_STATUS}, ensuring the device reaches DRIVER\_OK
> >> +        before issuing normal I/O.
> >> +\end{itemize}
> >> +

[...]

> >> +\devicenormative{\paragraph}{Device Notifications}{Virtio Transport Options / Virtio Over Messages / Device Operation / Device Notifications / Device}
> >> +\begin{itemize}
> >> +  \item A device (or device-side bus) MUST send \msgref{EVENT_CONFIG} whenever
> >> +        it makes a configuration change or status update that becomes visible to
> >> +        the driver. The message MUST include the new configuration generation
> >> +        count and MAY include the updated configuration data.
> >> +  \item If the configuration data is omitted from \msgref{EVENT_CONFIG}, the
> >> +        device SHOULD include the relevant offsets/lengths so the driver can
> >> +        re-fetch the data via \msgref{GET_CONFIG}.
> >> +  \item A device SHOULD send \msgref{EVENT_USED} to inform the driver when
> >> +        buffers on a virtqueue have been consumed, unless the device relies on
> >> +        an alternative, agreed-upon completion mechanism.
> >
> > Should this not be a MUST requirement? The driver might hang or need to
> > poll otherwise.
> 
> The idea here was to let this open so that implementation relying only on poll are
> still compliant hence the SHOULD.
> 
> Maybe we can try to rephrase this in a better way.

In my understanding rephrasing as MUST would be OK, since that only
applies "unless the device relies on an alternative [...]".

> 
> >
> >> +\end{itemize}
> >> +

[...]

> >> +\drivernormative{\paragraph}{Runtime Virtqueue Changes}{Virtio Transport Options / Virtio Over Messages / Device Operation / Virtqueue Changes During Operation / Driver}
> >> +\begin{itemize}
> >> +  \item A driver MAY configure additional virtqueues after initialization using
> >> +        \msgref{SET_VQUEUE}, provided it follows the same validation steps
> >> +        (e.g., checking the maximum queue size).
> >> +  \item If VIRTIO\_F\_RING\_RESET is negotiated, the driver SHOULD use
> >> +        \msgref{RESET_VQUEUE} before reprogramming a queue to avoid races with
> >> +        the device.
> >
> > I do not understand how this avoids races which could not be prevented
> > through a single message.
> 
> The idea here is to say that an active queue should first be stopped/reseted before
> reconfiguring it so that there could not any ongoing usage of the queue when it being
> modified.
> 
> At the end i guess this is not specific to that transport, so we might simply remove this.

I think it should be fine to remove the requirement.

[...]

> >> +\msgdef{GET_DEVICE_FEATURES}
> >> +
> >> +Drivers retrieve device feature bits in 32-bit blocks via
> >> +\msgref{GET_DEVICE_FEATURES}; the response echoes the requested block index and
> >> +returns one or more 32-bit values with the feature bits in that range.
> >
> > I do not understand the purpose of echoing request values. Looking at
> > virtqueue messages, the driver keeps track of its outstanding requests
> > internally and looks them up upon receiving the response. Doesn't a
> > virtio-msg transport also keep track internally? What advantage has
> > echoing?
> 
> We only echo the index in the response (there is no data in the request).
> The idea here is to allow asynchronous requests/response and provide
> an easy way to identify the content of the data in the response.

I would have thought that it is simpler and more robust if
implementations would refer to the token to identify which request is
being responded to (instead of possibly taking the response echoes at
face value). Implementations might even have at most one outstanding
request at a time.

> 
> >
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_msg_get_device_features_req {
> >> +        le32 block_index; /* starting block (0 == bits 0-31) */
> >> +        le32 num_blocks;  /* number of 32-bit blocks requested */
> >> +};
> >> +
> >> +struct virtio_msg_get_device_features_resp {
> >> +        le32 block_index; /* echoed starting block */
> >> +        le32 num_blocks;  /* echoed number of blocks */
> >> +        le32 features[];  /* num_blocks entries, zero-padded if needed */
> >> +};
> >> +\end{lstlisting}
> >> +

[...]

> >> +\drivernormative{\paragraph}{SET\_DRIVER\_FEATURES}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DRIVER_FEATURES / Driver}
> >> +\begin{itemize}
> >> +  \item A driver MUST set only the feature bits it intends to enable in the
> >> +        blocks supplied to \msgref{SET_DRIVER_FEATURES}.
> >> +\end{itemize}
> >> +
> >> +\devicenormative{\paragraph}{SET\_DRIVER\_FEATURES}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DRIVER_FEATURES / Device}
> >> +\begin{itemize}
> >> +  \item After processing \msgref{SET_DRIVER_FEATURES}, a device MUST update its
> >> +        acknowledged feature set to match the data supplied and MUST report that
> >> +        set consistently in subsequent \msgref{GET_DEVICE_FEATURES} responses.
> >> +        If it cannot support the requested set, it SHOULD clear the FEATURES\_OK
> >> +        bit in the device status.
> >
> > W.r.t. device status I think this rewording would be clearer:
> >
> > it SHOULD clear -> it MUST NOT set
> 
> How about: It MUST clear the FEATURES_OK bit in the device status if it cannot support the requested set ?
> 
> MUST NOT set implies that it was necessarily unset before which be a bit less precise.

My understanding:

"Device Requirements: Feature Bits" mandates that

	The device SHOULD accept any valid subset of features the driver
	accepts, otherwise it MUST fail to set the FEATURES_OK device
	status bit when the driver writes it.

According to "Driver Requirements: Device Initialization", the
FEATURES_OK bit in the device status is reset in step 1. It is only set
in step 5 if the device accepts the subset accepted by the driver.

Therefore, the FEATURES_OK bit in the device status is not set in the
scenario outlined in the last sentence. But the last sentence also seems
unnecessary as a transport requirement, so could just be removed.

> 
> >
> >> +\end{itemize}
> >> +

[...]

> >> +\msgdef{SET_DEVICE_STATUS}
> >> +
> >> +\msgref{SET_DEVICE_STATUS} writes a new device status value. Drivers use it to
> >> +progress through the virtio-defined states or to request a reset by writing 0.
> >> +The device responds with its resulting status, which may differ (for example,
> >> +if it refuses FEATURES\_OK or sets DEVICE\_NEEDS\_RESET).
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_msg_set_device_status_req {
> >> +        le32 status; /* desired device status value */
> >> +};
> >> +
> >> +struct virtio_msg_set_device_status_resp {
> >> +        le32 status; /* resulting device status */
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +\drivernormative{\paragraph}{SET\_DEVICE\_STATUS}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Driver}
> >> +\begin{itemize}
> >> +  \item A driver MUST write 0 via \msgref{SET_DEVICE_STATUS} to request a device
> >> +        reset and MUST re-read the status (e.g., via \msgref{GET_DEVICE_STATUS})
> >> +        if it needs to confirm acceptance.

SET_DEVICE_STATUS already responds with the resulting device status.
Why would re-reading the status be necessary?

> >> +\end{itemize}
> >> +
> >> +\devicenormative{\paragraph}{SET\_DEVICE\_STATUS}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_SET_DEVICE_STATUS / Device}
> >> +\begin{itemize}
> >> +  \item A device MAY clear FEATURES\_OK or set DEVICE\_NEEDS\_RESET in its
> >> +        response if it cannot accept the requested status, but it MUST report
> >> +        the resulting status accurately.
> >> +\end{itemize}
> >> +
