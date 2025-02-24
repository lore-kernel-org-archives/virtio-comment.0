Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B3264A99
	for <virtio-comment@lists.linux.dev>; Mon, 24 Feb 2025 17:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740419283; cv=fail; b=Z7/fa+GBJOFEhIqTOYYRcAAy5MdX2eM8r2d6SkbNyVSVdnd+6ZxtwQWixcGvHh3w/z2dgdJpbUamT1MTAXKqFmxuNG+eMaDSl9oIZ78vkpElMXhXry6O29Wie+9/Ixbh+dbgwm5HunMP39xPHnG9rsSls/72LVNSPl3h8Z51p9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740419283; c=relaxed/simple;
	bh=H8OVfHGLMcjjXc6u1JSlFlIcCh7E2Jjz0rGq0+FDKyI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=RGlcnXYHGC3IF5yusa1gWtF3GMjqNjal7ficeijXXwIgsWPgqtk4XCjsiR4sw/YAaGIp+in6Rhr6evWiiudmLdIpD2/4Q3ep+qbbgzMYPDKTyLfFEbrfjVdHeyJNfnCm39r/hXUuKw7sleoiAfZDc6ONWQXRklQcWKZHT6O3Irk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=qyJQFPie reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="qyJQFPie"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OB1TTT006119;
	Mon, 24 Feb 2025 09:47:59 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 450qhc8tvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:47:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqvtPfNBfcwk/ZPhgzrfOjqSK2nFTsZVznJLdMlmnEb9JO44X7OFqcs4gfjxESkIOvMNxfnebfAV+IMtvpMNX01PxAf4ddbzeYSl6u28sX2+8NCa6caHHcW8+zJq3wzhQ22mvolXRnWBlLMzvI629Z5nNRO8VMeX+wRkrAOxMlXCJA8nBfCtbk7E6v/L6m8F44mp0PtkxEY0WGdXGN3dhJKHggw88nj54b6+FddaA3QxpUoKEkt2p1yWTVLFI+s2cUMiI+nHK1rq3Ik1RPxihcVFa2L/vxmayJ/ll2SZLXgOtEY3cZAc4KzVmO36YhhCpYAtae11B+WSFlJkHqQUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq8Fosi6tTsDA/tlM5yQAVa4yA+u3DyFG5wXF1ptLeY=;
 b=NSkWTgVnDLb3QEprpFKOV+jz9l1YIyMR1/5QgDMLFVb7W257aetFYgM8JKILzZzGdcGmK3/IS5zBUgocUbjC0gWHUzQOvMIVCvN2BJW4XWS+NZZb8khuO4gliTKb+XA+OxIHYFe+JM/uGE6V63lXNcR5NUnsoYM9cCT/j4UZKV6Cj+FklbwuYuczXT+DAMW/P96vvWQ4q1b01ULQwZ91fpSArhBkmhmA5uKpr2vvgeR2+8HV2m32aywRfffXxexYpd6SStrQ/4hOQCgzjIpS2q2K1LwkRtdWXWOnCLniXS260wjY1ZIbgGLdkOu3RThWuXg7Zu2+67U5EzBwI9Wejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq8Fosi6tTsDA/tlM5yQAVa4yA+u3DyFG5wXF1ptLeY=;
 b=qyJQFPieL+eWN2+mPIxxQ/K/vTsAu4P2VL7eb5HqTTO4ru0krDc31lLKBgigllI9W3GGrqYfvixSWRRjSaW2QgCcVz/z8OPAUjquxmMXE+CuaTWJpR5LtEMmB8ZporT7Z7RRbjk8g+AsEP3op1KhNMsr6U6XbLw0Da3KnNZh1GY=
Received: from DM4PR18MB4269.namprd18.prod.outlook.com (2603:10b6:5:394::18)
 by DM4PR18MB4382.namprd18.prod.outlook.com (2603:10b6:5:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 17:47:54 +0000
Received: from DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a]) by DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 17:47:54 +0000
From: Shiva Shankar Kommula <kshankar@marvell.com>
To: Jason Wang <jasowang@redhat.com>
CC: "pabeni@redhat.com" <pabeni@redhat.com>,
        "willemb@google.com"
	<willemb@google.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Nithin
 Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>,
        Rahul Bhansali <rbhansali@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Topic: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Index: AQHbgn6ramcqJN/HSUCxE4NY9IHmd7NOJz3QgAFHaICAB1IyoA==
Date: Mon, 24 Feb 2025 17:47:53 +0000
Message-ID:
 <DM4PR18MB42695701DC0DB5AB4FABE902DFC02@DM4PR18MB4269.namprd18.prod.outlook.com>
References: <20250217172509.107212-1-kshankar@marvell.com>
 <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
 <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4269:EE_|DM4PR18MB4382:EE_
x-ms-office365-filtering-correlation-id: 9e4a6365-fd00-45a7-7fbf-08dd54fb5da2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3E1WEVzQTFrODc3THRxT1NMV2hYVmZ2S25PdnRjU3pxQ0RobFZFeThRSmtI?=
 =?utf-8?B?STlnUHUzN3pkRkJVVDg4bDJPWUhwZGd6T3VBWVk0ZFFNTXVwRkk1cDlhVlJL?=
 =?utf-8?B?VE1nVVE1czQ3RXkzajlSa3ZTNmpmODZUZHQ4WHRQTjdhZDljYndjWUhlTStU?=
 =?utf-8?B?YkI4ZkVGeGNHOTJPS3lRS1FzREtNTVJkTWh4dXVwNnlVZktBRTlwMzBDYlhF?=
 =?utf-8?B?VzBsWGdYeUJ4NmcyeTlBU3pYR3BLK2xtMjdMalpNdk1hendsUFliUVpsT2tL?=
 =?utf-8?B?OFRBVTVnaUV5VHA3REVUZjdqaFdRKzVPU1hGbStLcmZPSFd4a2lyOVFuZU9y?=
 =?utf-8?B?SUFGY1lKYmtLU0FZbG5wcWEyTUxDRk9PTU9IUlMxNjdlQXhlTFMwTkhobFU0?=
 =?utf-8?B?ZlA3bEdzVVRYVWhyRFVuTHN2RjV6ZzA1SFFYV2hqOFV4Y3NKaTUvVzBmb1RZ?=
 =?utf-8?B?amFPcFg5QkhaYnNlUWdQc3EwVTVLSThFNk9Md2N5WkF5eTdWaXJzYm95T2hl?=
 =?utf-8?B?eU9uakVxdEZsdWZreWg5U2VkejM4NUJlZUh1dkx3cUJxa3Vaa1JOaS9iNHQw?=
 =?utf-8?B?K0hpMDg3ajhNUGgwRyt3ZXY0alF6MWRUSTk5M2kzeW4zbk1WdWo4SzlrTW1j?=
 =?utf-8?B?YWpvellJVExRdmVHWVVLd3FnOUsyTHhCQkZvc0hJcTdDVGsrdkNoRStwZjNM?=
 =?utf-8?B?Vlh0Sml4QkNMdnJSVUdBY1ZQbkN1SFJDS1QvSXNQVkphZVZwQkp1VkJsMkFl?=
 =?utf-8?B?b29ESXZnZlRpSC9OQ1FnQlpjU3pvYWowb1ZRNDZ6bFRTc2lMNUkzOWpIM0tL?=
 =?utf-8?B?bWZBUENqTTlONUUzQVFrcDNNQVY2MG5OaHFZQzM1ZjdCSmVJQ0tuTk1rWndE?=
 =?utf-8?B?WXBGam1PZnRZVzdFL3NGbDk4RXZWeXdNU08wd255dXRtbVlEVmpXRnpsS1Nv?=
 =?utf-8?B?Ri9ZbE8vS3diYTBmbjd2dk8xN2ZNc1hJejQwTWFnQ2VlaGZNZnZseDNOWUhM?=
 =?utf-8?B?N3hBU3BnL3laQjA2a0FLM3hWY3lVRkRGc2NCbzFMZkVURTI3clk1aVJoVVZp?=
 =?utf-8?B?STZMMHhKWFprL043czNYNGJ3bmdyNXJjOVltYStvelZ1OUI4N05DR0FsYUJp?=
 =?utf-8?B?V0YzR0tUZTBFWm0yMHlmN0FGMGZPVHh4TUNUN2RiSVNBR3puWjRJanlOTm5D?=
 =?utf-8?B?d2J3YlcraUF2REo3eDVlQmc3aFBkU2M5VlY5U042bWNEM1ZrMzU0Y0FEZVE4?=
 =?utf-8?B?K2FkN3p4Uk5TQUJYRmxmaVZzaTZSdzVnNXFhc3VuOS9OMHBOcTVFSlZKMWxX?=
 =?utf-8?B?YWpEMU1kc05aZDVrTFVHSjlEWVhUTlI0Z0dJd2NiZ1NRMlFhZ1NvZWdEKzJ6?=
 =?utf-8?B?Sk5HdmRWMWMwQVNrTVBuc1c3YUZLVUo0K1h6SDJGVDFuem4rbC9rY3B0MDdl?=
 =?utf-8?B?b3FhMmxRNzlDeHlRcElnTzVJUDZoUVJwcnRzQk1WNzVkYW9kT3czSVY1bUho?=
 =?utf-8?B?TThZVGtNSWxUNllDeWlEaEFFcnVxdVRSQW11eC9scXd3VGtueS9OQWs3Vkx3?=
 =?utf-8?B?MUthQVcrOVp2ZlN3WGF1T2xLR21hWTRlUkZrcDdCbnIrbHRwVWFySGxobUhU?=
 =?utf-8?B?TUx3MmoxaWlXd2tFOXRabWRaMWZuZEJoZUZKcDd2WDB2UTNwbmtNUlAyTzlN?=
 =?utf-8?B?L1d0SHgwdE1zYm05cFY5bXRmSzlRSGl6WGhyY0ROWG0zVmsrWVlZbUJmVXVE?=
 =?utf-8?B?TDRtV3ZVVEExeGlIUjZBSmFIQXowN0gxN3hhUFppQi92WWdhbGpmNmpMZTds?=
 =?utf-8?B?Q2NNR3UyMmJBdnQ1U05PTnFSN3ZjNFlyell5R0hzRi9VV0dGTGYvdFlNUjdo?=
 =?utf-8?B?TGUrZ3ZsRmxTTlpaS3g5QWZ3Sm5wamoxZTk1ZlFWUlptc1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4269.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVdXdEpJMHVkT0ZINUlMaU5wWHNrVzBTSkhwMUxHOVREcnNTUElOVWgxZ25N?=
 =?utf-8?B?TmY5b2hQWldjTG5GRmwyV0ZOZm5BaHJvcFJtSkVIY3J2MWRtTTBmQTJlUjBt?=
 =?utf-8?B?VDRTQXpucjJRUE1BSFNmN3YrUEZXM1pLbGRnTWEvR0lqTGI5SHk3MExHQjdR?=
 =?utf-8?B?S09YdmU2K2k3OEV3V0xLaGhLUThMc25zelNSRzRTcE1tOW84UUhvRTFzcnNt?=
 =?utf-8?B?S245MHBiUlNUZmYzSW9iUDRzOUlHL0tFYlAwd2p5bCtLZzN6T1B1NjlKaytW?=
 =?utf-8?B?WStoR3JlZUU3S2R4N05pZ2loZFpKQjAxZERINmlxMndObEpYMk84Mlh3bnlS?=
 =?utf-8?B?cjN5WHBtUnlxUkZReXFZMFdQRmtGRERTVTUzUUVGbXcreUpXMUZzeEQ3WXRT?=
 =?utf-8?B?Tzd0bXNJMTY5S1lCY3ZPcm51SXdaSHZFdE8yZ0xXSHYyZ09rMktQZHY5ZVNW?=
 =?utf-8?B?NUFVN1BzZ2xtUkU1WW81S1ZaZW5IRFpuait4Yy9udmpMV2N4ZndBS3o2azNQ?=
 =?utf-8?B?Qy9mWFVrY3hkRklyaFNIK1N0WC85RkhweXpWeGVpU2IrY2cvUnUzQVlLS1hZ?=
 =?utf-8?B?c0c3TmVUMnZEUzYzOWZXeHY5NmJIaklmbGJTMVEwS3pNOCtLaFU5eEgwSmU5?=
 =?utf-8?B?QXVEN0dFTTBNRHY1dEw0RktLQnlqS09PamNOWDQzQVZIaGdHTk9YcEc2ckZq?=
 =?utf-8?B?ejlaWU95WkFEclg0VUU3U0NYb0NVRHNKRDUrRFh3UU1ab29pbkpOdWxyRHUv?=
 =?utf-8?B?ZGNPejQrN1RHMm1KUkVBanB0dkcrR1hOQmxyQ0s4cHhUVFdVZVJJOGN3TExU?=
 =?utf-8?B?VGxJbjJnUFlLN3FHNURKR0kzY2psVmVXRitkeUJUOFJNdVkwQjdCdGE0bUlP?=
 =?utf-8?B?cVdKNE8zQktaQUFhZWFiTm9SYU0yWExuQ08zWUtILzE2RmJKSW1pRjVOZm02?=
 =?utf-8?B?N1lQL0xMTXZuRk1ndzF0a1hNV3pIS0lBd25PWGdMQW1pa2RBV1VSemJ6YUUz?=
 =?utf-8?B?bjd0dWNtZ0ZXb1R5Ry8xcWNuc2xMYVprZE5DTVJpeDNseVgvM1JPVTFUWTBn?=
 =?utf-8?B?dEVvYW03eG9CdWUybnVFQXFYZEQwTUl3Q0FQcHZqUjRnZzd3aUhodUVnMGFp?=
 =?utf-8?B?VDBmVTZrcEpiNy9abCtHNjBDb212cVZ0Vk5tSlB4Mm9sRDVXSWRjdlBGNG9S?=
 =?utf-8?B?dVpNbGVLNDM3SUw1NlQyWUdYT1Rqbk1TS0d6NzFiUmlpRy9LVStqU1J5WFZU?=
 =?utf-8?B?VU9hdkwvKzhmNTBJNlRkTFZBcDJLU01NUHdPeE1PaTM4Vm1XY2RaUWxxWUZy?=
 =?utf-8?B?SzlBYURGcUg1KzVtbVlHbjVVYlRLT2liNGRBcllYZFVOQ3hsb1A3dVFoWU9N?=
 =?utf-8?B?TDN1U1VvRDFQVVR1N3BndHQvdnZSazg4N3hpTUNHZ1BOWXNpNUNhUWxDdFB4?=
 =?utf-8?B?U2E1UUQ2MnlHZWZ4bng5VGx3ZTg1RXVPUmJ4Ny9oaFJzdm9hSHVIbC9EUVRw?=
 =?utf-8?B?UjhrRTdTaFhJVjlNWDI0NWNnZ1FYc1N5MWNKK2JPQyt2akVGY3JSeCtqZGlZ?=
 =?utf-8?B?d1ZzYUI3c2xpYU8yejNWb2NJNDZqMDNQTTdLL0diU1pVZ3FUN1E4TkFWb0pT?=
 =?utf-8?B?YW1oK1JJeVFNYk1aQWlxc2R6L2h4M0w3WDNkOXZlODVmV25ROWtqdVJZSkJo?=
 =?utf-8?B?dXNlNVlhQzdTdmFRcnQyallvVDBoRHNmRSt1TFczSHF4YUlZMUpzUGx6R25J?=
 =?utf-8?B?Rit0MHM2Q3FwSmt1cFF2M3RuWXhLVDBVcXc4MDJiRTVvd01vcDhqdkVOWFpq?=
 =?utf-8?B?Um4wZ1h2NDZHV1drUkZwTjNKSDAzby9CT25samdvZnNkSjM2ZHhscXYyOFRI?=
 =?utf-8?B?ZGxQQy9lVk9QNnFNZnJhKzhMayszMStlZk1QbFJpRjRDeldRa0Q2R09paDhQ?=
 =?utf-8?B?Q2tJYjVkdzZ2WGVoNXdGTzJBeDZkNjYzdFkyYlBybEFHWmJvemYvRnJwS0NW?=
 =?utf-8?B?bExtNUV2RU15UmJOcU5NZ29xdGhKeVc3bHlrZ0FrUHRla0x0a1AvRU03ZS9Q?=
 =?utf-8?B?dmhZREJ4ZkxVODZZNVhEa2l5dUgvd0EwQkNMRm9VYXQ5c2V3a1R0SUFHbXBl?=
 =?utf-8?Q?sBu1HRgKLkDtA/DnZH5452b5/?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4269.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4a6365-fd00-45a7-7fbf-08dd54fb5da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 17:47:54.0766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5UMJ6ItLi8NYWxT83UkDtvIONHehcRZeqIM9OVkVIsgcW0FXGeovNImX8i3fwT9ATDYNy69OWuVV1XJQr5WeUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB4382
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 9dvYuYniIj8pkGi5UchQbekSV2Gw2T8q
X-Proofpoint-GUID: 9dvYuYniIj8pkGi5UchQbekSV2Gw2T8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01

> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Thursday, February 20, 2025 7:20 AM
> To: Shiva Shankar Kommula <kshankar@marvell.com>
> Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio-
> comment@lists.linux.dev; Nithin Kumar Dabilpuram
> <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> Bhansali <rbhansali@marvell.com>
> Subject: Re: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field =
to
> indicate outer network header offset
>=20
> On Wed, Feb 19, 2025 at 2:=E2=80=8A40 PM Shiva Shankar Kommula
> <kshankar@=E2=80=8Amarvell.=E2=80=8Acom> wrote: > > > > > -----Original M=
essage----- > >
> From: Jason Wang <jasowang@=E2=80=8Aredhat.=E2=80=8Acom> > > Sent: Wednes=
day, February
> 19, 2025=20
> On Wed, Feb 19, 2025 at 2:40=E2=80=AFPM Shiva Shankar Kommula
> <kshankar@marvell.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Wednesday, February 19, 2025 9:00 AM
> > > To: Shiva Shankar Kommula <kshankar@marvell.com>
> > > Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio-
> > > comment@lists.linux.dev; Nithin Kumar Dabilpuram
> > > <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> > > Bhansali <rbhansali@marvell.com>
> > > Subject: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field
> > > to indicate outer network header offset
> > >
> > > On Tue, Feb 18, 2025 at 1:=E2=80=8A25 AM Kommula Shiva Shankar <kshan=
kar@=E2=80=8A
> > > marvell.=E2=80=8Acom> wrote: > > This patch introduces a new field in=
 the
> > > virtio_net_header called out_nh_offset, along with a new net device
> > > feature, VIRTIO_NET_F_OUT_NET_HEADER.
> > > On Tue, Feb 18, 2025 at 1:25=E2=80=AFAM Kommula Shiva Shankar
> > > <kshankar@marvell.com> wrote:
> > > >
> > > > This patch introduces a new field in the virtio_net_header called
> > > out_nh_offset, along with a new net device feature,
> > > VIRTIO_NET_F_OUT_NET_HEADER.
> > > >
> > > > Currently, drivers lack a dedicated field to signal the start of
> > > > the network header to the device when performing checksum offload
> > > > and
> > > segmentation offload. This requires reading packet, which
> > > significantly affects performance in datapath.
> > > > Additionally, some hardware implementations requrie knowledege of
> > > > the
> > > outer L3 offset (aka L2 length) for inline IPSec hardware acceleratio=
n.
> > > >
> > > > To address this limitation, we propose splitting the csum_offset
> > > > field into
> > > two 8-bit fields named csum_offset and out_nh_offset.
> > > > The csum_offset indicates the offset value from the csum_start and
> > > > may not exceed 256B bits(2^8) for protocols that use a 16-bit
> > > > one's complement checksum
> > > >
> > > > Following table lists such protocols and their checksum offset
> > > > fields within their headers
> > > >
> > > > +-----+--------+
> > > > |Proto|csum_off|
> > > > +-----+--------+
> > > > | IPV4| 10B    |
> > > > | ICMP| 2B     |
> > > > | IGMP| 2B     |
> > > > |  TCP| 16B    |
> > > > |  UDP| 6B     |
> > > > +-----+--------+
> > > >
> > > > The out_nh_offset represents the start byte offset of the outer
> > > > network header from the beginning of the packet
> > > >
> > > > This issue was briefly discussed on the mailing list in a
> > > > different thread, which can be found here
> > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o
> > > > rg_a
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_
> > a  >> > > ll_DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2-
> > > 40DM4PR18MB4269.namprd18.pro
> > > >
> > >
> d.outlook.com_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3b
> > > CCyFq0M
> > > > EWPS2176D_oSryc7cD-
> > > 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_
> > > > nHyksxDbHI3UT0OFedi-b&s=3DMR9AX0Md9PFbZjQM-
> > > bwJAmO13ZwETRZJCm9qFIYDy6E&e=3D
> > > >
> > > > v2 -> v3:
> > > >  - Rebase to virtio-1.4
> > > >  - Addressed pending review commnets related to wording.
> > > >
> > > > v2 -
> > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o
> > > > rg_a
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_
> > a  >> > > ll_20250128142152.3662988-2D1-2Dkshankar-
> > > 40marvell.com_&d=3DDwIFaQ&c=3DnKj
> > > >
> Wec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS2176D_oSryc7cD-
> > > 0TRPs&m=3Dja
> > > >
> jIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT0OFedi-
> > > b&s=3DjvYZB
> > > > QtOwWyydI5lFvCFz4hF94jDmU70nROTU44Ma0M&e=3D
> > > >
> > > > v1 -> v2:
> > > >  - explicitly state that the out_nh_offset can be set only when a
> > > > valid
> > > network header is present.
> > > >  - updated out_nh_offset usage in the RX direction.
> > > >  - minor word cleanup.
> > > >
> > > > v1 -
> > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o
> > > > rg_v
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_
> > v  >> > > irtio-2Dcomment_20250114171636.3175670-2D1-2Dkshankar-
> > > 40marvell.com_&d
> > > >
> > >
> =3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS217
> > > 6D_oSryc7
> > > > cD-
> > >
> 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT
> > > 0OF
> > > > edi-b&s=3DrzyoQrmZTznG5V9N03u7bpPbG1uQC0WPFmypJJKS9r8&e=3D
> > > >
> > > > Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> > > > ---
> > > >  device-types/net/description.tex | 37
> > > > ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 37 insertions(+)
> > > >
> > > > diff --git a/device-types/net/description.tex
> > > > b/device-types/net/description.tex
> > > > index b546cd7..2a4aa66 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device
> > > > Types / Network Device / Feature bits
> > > >
> > > >  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device
> > > handles packets
> > > >    carried by a UDP tunnel with partial csum for the outer header.
> > > > +
> > > > +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the
> > > > +start of \field{out_nh_offset}  value. Device gains advantage by
> > > > +not reading packet to calculate outer network  header offset
> > > >  \end{description}
> > > >
> > > >  \subsubsection{Feature bit requirements}\label{sec:Device Types /
> > > > Network Device / Feature bits / Feature bit requirements} @@
> > > > -592,6
> > > +596,13 @@ \subsection{Device Operation}\label{sec:Device Types /
> > > +Network
> > > Device / Device O
> > > >          le16 hdr_len;
> > > >          le16 gso_size;
> > > >          le16 csum_start;
> > > > +        union {
> > > > +                le16 csum_offset;
> > > > +                struct {        /* Only if VIRTIO_NET_F_OUT_NET_HE=
ADER
> > > negotiated */
> > > > +                        le8 csum_offset;
> > > > +                        le8 out_nh_offset;
> > >
> > > Need some explanation why reusing csum_offset is better than
> > > introducing new fields.
> > Our objective is to preserve the current size of the virtio_net_hdr str=
ucture,
> to ensure compatibility with the existing header size.
> > (unlike other features such as hash reporting). Given that the
> > csum_offset represents an offset within the header and may not exceed
> 2^8, we propose utilizing the existing space to accommodate this newly
> introduced field.
> >
> > Would it be more prudent to add a new field for this feature ? Do you
> foresee any issues with this approach ?
>=20
> It might have some compatibility issue. For example in the current Linux
> implementation, csum_offset were 1:1 mapped to skb->csum_offset which is
> a u16.
>=20
> I haven't checked all the protocols (especially the tunnels) but if one d=
ay
> there's a protocol that uses a csum_offset >=3D 256, it would be problema=
tic.
>=20
I agree with the 1:1 mapping between csum_offset and skb->checksum_offset.=
=20
Given that the virtio net header size is already a scarce resource for addi=
ng new fields,=20
additionally increasing it for every new feature might impact performance i=
n the data path.=20
Would it be fine to add a note stating that when the VIRTIO_NET_F_OUT_NET_H=
EADER
feature is negotiated, checksum_offset cannot exceed 2^8 offset ?

> Thanks
>=20
> > >
> > > > +                };
> > > > +        };
> > > >          le16 csum_offset;
> > >
> > > It seems like it needs to be removed.
> > ACK .
> > Inadvertently included in version 3. Will fix up and send version4
> > >
> > > >          le16 num_buffers;
> > > >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT
> > > negotiated)
> > >
> > > Thanks
> >

