Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678036;
	b=UFdH4BHuIEfnm5EhXQhg5sIhs8VC/vJeZMAt16ZSdY9BzeW2cYLfNqMfy2XcyfFWP97C
	 1aiYIO518PMeHQzeMdFPaiL8tzonzdiK761Let/OqA8IM7lrxHC5I2NgcLFA370ydrmZg
	 n/hDdbxxFoDfZ6yf1hb1T+0xU6iWPy/1nn+3EQphhk/zgCrBnRZffEzO87yXrIDbk/j6P
	 a8O6+woBiyb/h6JEjZf+bBqm5o1q4QOtW29+RsWi0Zp67T+S8ClZlTzxw5afmnLNCb37n
	 oiaKMgGm21EgPG37JZ0KvpdMLzT9gqRMCH8rNVb6GXLJw6Rhxksi+C0X5VNuOzF3cVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PHxkHkRvpW7L9PaztVEcb20GM5uuT6jFdpYWEeqKdhY=;
	b=wy7xBt/avRfja5jtBfA6z8nuCzneWHzB2x6fy0Ep594pPm6R8fVtC3t8ggkniQw1QZY3
	 eAWF610Vg3LCidyI9DqeGYAOhjsktdRVqk+I4SFPgis9ZkwJ87Q/5+3lIPtVsjdfKarQF
	 AMkzFoLD+AonIjNUoGNiJsq5YJuhQvm24s9bwlC6tXaKedqIVf+GSWQypl3RNkdqDo16c
	 qDc9ZGi5d0HVXPkAS5aEwZDgcFwb4X/8IdnsJBFnnF+P0gXPXvBBVMxBCJNx6aHUj08o1
	 X0kXIJKkCCB/dWVsMwHPZx/OKBzTA9FfWADrWaumMFj7VxAHPfxepKcdjesdceyl9Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaA4pXpO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3ND5Jnf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE4606A31E
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 14:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCE4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaA4pXpO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3ND5Jnf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MDjvCe4005301
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 14:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHxkHkRvpW7L9PaztVEcb20GM5uuT6jFdpYWEeqKdhY=; b=GaA4pXpOCVGq2rpH
	t1wFiEl/dTA0Ee+vfYA6QuDC2YZ9tShOtY+WzyB3TEenCMZW5PDSk4Ih30yFWEh4
	w7QGqJMAI58i+qXspzj8r6ek+EYtjU6GhtgFgbLKX6S+JxWG7tBzfFvT3RxabmeJ
	8MvMPRBJr7Hxa48utxmXF/yr5fMpxidrRiUFQJ/srJFEqxbHCkw8VUrTjUNL+Qgd
	WfrNroSDrgqAIaP4PrG3pqyfSF7UCpfVkvfZ5Dor9p2zf0qvlZduYXiCkPb9sHp/
	Ei9u1D4A9cIoR7d5rCxRgQekVhjtf3jM4vW3Gugky4xHii+oM++vtuSL1ugZBaHR
	2YP9jw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93auvn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 14:07:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bea8fed6so1387021241.2
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792678033; x=1793282833; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHxkHkRvpW7L9PaztVEcb20GM5uuT6jFdpYWEeqKdhY=;
        b=B3ND5JnfSdqhctKsQXggqddKiNmRYUfZFbwaoW9mTqrMBu3/0dPKDPS5a0qulpIFJV
         fTySA3GvJOOtY4EqFsdbNVUYlUdB0NTbs7I40xxZRcOlYnVBb1glNoWItJFdTdTL/gAe
         ydQJd3mhmeoOsLHstTxl+9n48ps/fQd2RQW5HYSwJbVNCKL07wLdOsrlYD5IE3DeunCf
         WTlF80pdgQg6cPojRvPZ+rQg2owwZfOuylR72HFsfRxvLNgl9Hpj4vOlprc6A+JYFjgp
         JZZDo/1ib5/Tqurdy+ekAQQqNh6rZxae2a9y87Bd/oqDlPBUi0q1bia7QGOaQ8s9K3Nd
         Gdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678033; x=1793282833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PHxkHkRvpW7L9PaztVEcb20GM5uuT6jFdpYWEeqKdhY=;
        b=xby9bD/h2zyXDoKtGOTsCsV5zCsp80ky+TDe6bQ3y4MGVnNwdGasjjwhMazdfhCYGV
         hoNtiTjUPB2YWwFWTs6lfYqJnqbLXkoMnLqQdV+Hrv+xppv8wQZuRTQ2ilrO3yVV161F
         dlmERz+e9w1iG3u2NP0ke87fHLQY8v4cHID0/jVx0hre/Zq+VQyozqk2csKybihDwCmX
         0WiL4d4Q9ee6691ng3DEOuUGrGlY0WgUJuwrYU+YKKrkgKYRKeNE8U5hCSpLQeNYKnsW
         bqvCLxDoJo77Zt00cNf+sFHzqUpxkwxho0W7EY5iE6lGIlaNyYenzdz4Hx/OxqA2zEoR
         J7ag==
X-Forwarded-Encrypted: i=1; AKwUvBxswnJuW0dX5Xnl8NNHxNoFI/Ax0G0VNzj0DT/7VibXZCDfReMfGnv+qCVkc1ssfdx3LwbazsBdD0lHLoViww==@lists.linux.dev
X-Gm-Message-State: AFq9FYKO93tJDRy33blhWhc5logdg93avolpWQm0Ri3f9rDrtPPTRnRR
	GXhRgEk2e2mlVtrtJc0QiGpFIrVjcoW84Rxf/0ca150RZgRdDaGh9xRdVDOzh5qP2I2IqKGZ7Mq
	9WdDeKJL9hnYFK3/4q51Rot7arn7eQZsdZkDHR/e4gqsc8UO2GUxVnJHNfv8EYEWh8w6fJA==
X-Gm-Gg: AYBFou240B6CbxQGmbLp8VCq0o4UEegvIi+VgbaH/lxBDlTY/4VN8x/+aDYiI5mNcfo
	1QgI5DENUJnelCyOgyEqOdIETrUOJRzHHCrB7ujJjCJt7LDijDc7ySpZx06gaI82zzx8cbTPGHG
	0Q2CIXUjd+LK5RiLn8mlCiqsFbnd2IxzDSPIJgTU93M79Yr5FBGRtAbAIaXTtJx/4GXAqp8dcxU
	T7XzgBhWwChFbVnMk5qL65RYZ9SsJNWu7674rDVm2R7yBc0KyLxMdl43Ki6dBO1o3mranwbMWur
	vnu/u1GFG/VchRxTTN4kKTUEHaF72/sYqgsPvMJSrbKeZqQ3gJCHR84UD0kQhMedcaPgWaygqlh
	D2PhmoyGPd4hiPIwc43iHxajhxgh2VbbyM2M/p6cl+jRVEstglOVwgSqdzJSDx2b14CGlyirp8T
	2C80oTGCztRwge
X-Received: by 2002:a05:6102:5489:b0:7cc:776:6c54 with SMTP id ada2fe7eead31-7cc926d0626mr2247872137.21.1792678033453;
        Thu, 22 Oct 2026 07:07:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5489:b0:7cc:776:6c54 with SMTP id ada2fe7eead31-7cc926d0626mr2247838137.21.1792678032893;
        Thu, 22 Oct 2026 07:07:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1244ee8sm1138805e87.84.2026.10.22.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:07:11 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:07:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>,
        virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org>
 <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022091645-mutt-send-email-mst@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NiBTYWx0ZWRfX5UH91CscKDgZ
 T4mvXA3tPHfQVRlavDoQzFZVSZW+u9cMyG24oxsJFB0YUi6jyMl12UTCZ/m4Nc4Jz5YSTrBf7RY
 VsGV8DCndjJBpvQp5L9g0L11K/AweW90fSUqp44uKvfi5cKYHKA9+02Y+WmOkv1smr38b8cPy6B
 NVfRGM7yQ/iL91JcZE6t9cFbglYNd4j1N6O4IglS3sDQ7/EeJ6AXDwWiyCjmr/ldeM1xu3Lr4UV
 OkzIM2trUdn6VQqxUNgZgKk2LvoCuY9GoPttlq+jb5rKmfUnwf+y8Q8DKmEZjP5kZFWALeL9Iuj
 DMFD2eTBDBapbLwLo8MGHAcIioxfSJemusCA6lWxNqdFfs9kSkgd8W3+gqtEV8MQ6TEhfKYllUQ
 T9tXOERMs0izHbEQwRYJiemWUCUR7mTBInNMxzBrC+hi+csqhbkSOOXFLAwqMcmKPICjwnx2K08
 Txnfn3Ul3CqWKUhDYkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NiBTYWx0ZWRfXzXCTbAHedgYg
 iUioxT9IZ59It+tBTVsTcbwPEzJCBA8ZqCHILxONhohzP3TtuuXB4CR1D0XngQDnAtoIwg/iYbK
 foSJinNAYy/tyOAZ6QyXCoz0LEkTndE=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada1892 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=MHGeBgKlF6awthIeg7YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: Akq6DDhtkd7jdTCx-sukP-jN8TSmQ8Sk
X-Proofpoint-ORIG-GUID: Akq6DDhtkd7jdTCx-sukP-jN8TSmQ8Sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220056

On Thu, Oct 22, 2026 at 09:19:16AM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 22, 2026 at 11:41:17AM +0300, Manos Pitsidianakis wrote:
> > On Thu, Oct 22, 2026 at 10:24 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Oct 22, 2026 at 03:07:41AM -0400, Demi Marie Obenour wrote:
> > > > On 10/22/26 00:35, Cornelia Huck wrote:
> > > > > On Wed, Oct 21 2026, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > >
> > > > >> On Wed, Oct 21, 2026 at 03:25:31PM -0400, Demi Marie Obenour wrote:
> > > > >>> On 10/21/26 14:00, Peter Hilber wrote:
> > > > >>>> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > > > >>>> Firmware Interface). QPSFI devices expose functionality across SoC
> > > > >>>> subsystems through a common Virtio-based protocol. There are no plans to
> > > > >>>> standardize the devices.
> > > > >>>>
> > > > >>>> The Linux DCP display driver series is planned as the first user of this
> > > > >>>> device ID:
> > > > >>>>
> > > > >>>> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/
> > > > >>>>
> > > > >>>> Device ID 51 is already reserved for the Virtio HAB device:
> > > > >>>>
> > > > >>>> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> > > > >>>>
> > > > >>>> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> > > > >>>> ---
> > > > >>>>
> > > > >>>>     v2:
> > > > >>>>
> > > > >>>>     - Rename the device from "Snapdragon device" to "QPSFI device".
> > > > >>>>
> > > > >>>>     - Refer to DCP Linux driver patch as planned first QPSFI user.
> > > > >>>>
> > > > >>>>     v1:
> > > > >>>>
> > > > >>>>     - Was posted as "content: Reserve ID 52 for Snapdragon device":
> > > > >>>>
> > > > >>>>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/
> > > > >>>>
> > > > >>>>  content.tex | 2 ++
> > > > >>>>  1 file changed, 2 insertions(+)
> > > > >>>>
> > > > >>>> diff --git a/content.tex b/content.tex
> > > > >>>> index 243ce2dde36b..7416939e67d3 100644
> > > > >>>> --- a/content.tex
> > > > >>>> +++ b/content.tex
> > > > >>>> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > > > >>>>  \hline
> > > > >>>>  50         &   Video encoder/decoder device \\
> > > > >>>>  \hline
> > > > >>>> +52         &   QPSFI device \\
> > > > >>>> +\hline
> > > > >>>>  \end{longtable}
> > > > >>>>
> > > > >>>>  Some of the devices above are unspecified by this document,
> > > > >>>
> > > > >>> I think it would be best to have a single ID for vendor-specific devices.
> > > > >>> I believe most of the ID space has already been used, at least for virtio-PCI.
> > > > >>> --
> > > > >>> Sincerely,
> > > > >>> Demi Marie Obenour (she/her/hers)
> > > > >>
> > > > >> Sounds like a good idea to me. And then qualcomm can do what they
> > > > >> want, like check subsystem id for pci or whatever?
> > > > >> Only issue is there is no way to distinguish for mmio/ccw.
> > > > >> Maybe, add vendor specific id as first e.g. 8 bytes ro in the config space?
> > > > >> Peter?
> > > > >
> > > > > Using some information in the config space looks like the most flexible
> > > > > way to me. Are we still happy with how the device ids are organized in
> > > > > general (i.e. when do we want a new one, and when do we want to extend
> > > > > an existing device?)
> > > >
> > > > For a platform device like this, I'd prefer to pass the information out
> > > > of band.  After all, this device will only ever be found on Qualcomm
> > > > SoCs, and presumably the kernel knows exactly which PCI device is
> > > > supposed to be the QPSFI device.  This means that the kernel can just
> > > > special-case it.
> > >
> > > Yes but we are discussing making this id a general "vendor specific
> > > device", as opposed to a "qualcomm device".
> > 
> > Is there a reason why a generic VIRTIO_ID_VENDOR wouldn't work?
> > 
> > Instead of adding more and more IDs for different devices that will
> > never been upstreamed.

The driver for the QPSFI (well, at least for the display controller) has
been posted and it targets being upstreamed.

> > 
> > Then, a kernel can discover all vendor devices when enumerating the
> > transport, ignore them unless it knows specifically about them through
> > ACPI or device tree.

In case of QPSFI the device is visible to the host through the
VirtIO-MMIO on steroids. However, nothing prevents one from passing that
device into the guest VM (e.g. in QEMU) where it then becomes a
VirtIO-PCI device. The same issues would apply to any other vendor
trying to implement the driver for this VirtIO device (and trying to run
the generic enough kernel which supports multiple "vendor" devices).

> > 
> > It doesn't make sense to me that HAB/QPSFI need an ID when they are
> > unusable to anyone except for qualcomm kernel drivers so maybe we
> > should require that an ID allocation always needs an explicit
> > justification (i.e. "the spec will be upstreamed", or "we cannot use
> > VIRTIO_ID_VENDOR because X/Y/Z").
> 
> Right so let's just reserve ID 52 as VIRTIO_ID_VENDOR for now.
> And document precisely what you are saying.
> 
> And let's add a chapter for it please:
> 
> "A driver is not automatically loaded based on VIRTIO_ID_VENDOR alone,
>  instead, the platform probes the device, verifies it is the
>  correct vendor specific driver and loads it, all in
>  a platform specific way".

From my point of view this would be very fragile as different vendors
would implement different mechanisms to identify the device. It would
make it pretty much impossible to support multiple "vendor" devices in
the upstream kernel.

Let's define some standard way for the vendors to declare that this
device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
block".

> 
> and conformance clauses stating the same.

-- 
With best wishes
Dmitry
