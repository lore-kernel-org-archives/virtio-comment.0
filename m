Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D174AEE0
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846127; cv=fail; b=PwhaGe7ev+c6u4nElRItYZo9v0gviVXszzOHyg7CAUNayFPMcVIi9nwluq8DbYrFIac/7UpLbuF5zc4M7IsdN3RHr16XhYjEcymZezLTrPLWKnzHUEF0nyz2YxQ1MUufRfWXfGe02643eqm79O8Gq01SBoGREq9EgPBPjewMy6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846127; c=relaxed/simple;
	bh=xEo7TmMKXdZ7+tGw3GVWyO8ju+SHgQuKlgcRaKHW/fg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rn7m0lZKCFIjgtlhzpvihXPMgeTAlzhld1snaAhJ2hVCRCyEwSXZrDcADXRzZgFHcQr2+9+F0JOqobtoOgd8UDeuDguxNwxoNNpag7/Xwb0EgoAO6HP3Daspgcc9j7nYpzuCOKHCtfBBTjQZbCd6bwi5P2m6Z6chOXLiUVWbs/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=ltZ/9jh8; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="ltZ/9jh8"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SA1DQf017828;
	Mon, 28 Apr 2025 06:15:18 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 469g8aa5xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 06:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlFKwEfbRbLeutDlidj37TR/CpY83IcH2gi8FCI27nU59be5UtbqKUGnONKOgc75PecBTubOY4kUvxx0HEG3Vifaap/Umw7HYGvzxhYmg6xkYh3BPPprHpt40bZlt7by15qDK73lhf0b7N1VsCO3pDNQLTmWy0QaNSWsHxkJ18M+NhNa/CyoV0WKNOVd81GIeaFY+ufZUv3jhNIgFxpTo09DgKtzCikNf6iT5XoqxN+CHA21FI6Z0slCK1HhWIKwvQnDUV9JF1i+nCne1tizwdwSTIB4h8qEuaWotU4fSk2n48QmVx7/mTO3+aN+bADq5t29b5vTw5k+7K/cKDjVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEo7TmMKXdZ7+tGw3GVWyO8ju+SHgQuKlgcRaKHW/fg=;
 b=innurl1hl84ELGLXHGbqsWQqnMrsTOB7kXTF6uHYcplNOt9rd5tXeTVJMvPwxj1K4JlJClHTo5x50u0fEYmClo0EhCNLGFAYj2OrfdFRU3untbRljNwt1IgiBDzvUkGHdqAeuBGjaC42Z4ysl/g9KBf36SRYQMUo97AM0GGVD2SdFs4h30smuu2qYOnTske101/Io0VpvSfqgQcBaVKOU+ax/m3fpVWRQB8rpQj/fSQhXR4y1TY+X4VjsagHi6b/3f7ybtcM7+EKS0pRwDXEDKYyOkI1vZJpODRWXtR8bFWbcZiGdB570P/9RugLmhQYhdOVsCjS6qv64cwBrMRD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEo7TmMKXdZ7+tGw3GVWyO8ju+SHgQuKlgcRaKHW/fg=;
 b=ltZ/9jh8olP00So24VCQ032ddmtqm63twV8oK2S7DqrIe8ka9AO8WGn85QScXjKZZs40IDGD8zAu498ibW5w4sJwWhHLE8vREqCyqxBYs+OzNF4y5Wdk/B70F8pA5PefiS1oKKgyWTCg068sssQF0Kjq9zToqCk7yeS32VuljBw=
Received: from DS0PR18MB5368.namprd18.prod.outlook.com (2603:10b6:8:12f::17)
 by IA3PR18MB6143.namprd18.prod.outlook.com (2603:10b6:208:525::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 13:15:15 +0000
Received: from DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac]) by DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac%6]) with mapi id 15.20.8678.027; Mon, 28 Apr 2025
 13:15:14 +0000
From: Srujana Challa <schalla@marvell.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        "cohuck@redhat.com" <cohuck@redhat.com>,
        "mvaralar@redhat.com"
	<mvaralar@redhat.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        "sma@napatech.com" <sma@napatech.com>,
        Satananda Burla <sburla@marvell.com>,
        Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob
	<jerinj@marvell.com>, Anoob Joseph <anoobj@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH RFC v6 0/4] introduce IPsec Service in
 virtio-crypto
Thread-Topic: [EXTERNAL] Re: [PATCH RFC v6 0/4] introduce IPsec Service in
 virtio-crypto
Thread-Index: AQHbtPuUqf8d9PbTmkC+BChXtYZ8I7O4tEYAgABZJSA=
Date: Mon, 28 Apr 2025 13:15:14 +0000
Message-ID:
 <DS0PR18MB5368D98EC83321AFD2A35D53A0812@DS0PR18MB5368.namprd18.prod.outlook.com>
References: <20250424093046.1927395-1-schalla@marvell.com>
 <20250428032726-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250428032726-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR18MB5368:EE_|IA3PR18MB6143:EE_
x-ms-office365-filtering-correlation-id: 34b89144-c044-4bc5-fa42-08dd8656b68a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?czVCTVFIUHpQZm1kS0NoRElodWFPQXNhT1FaaXJ4V2ZQaUVZTjd5R2pzcTVK?=
 =?utf-8?B?ZlRWWG4ySHBsQW5QNlFKcHJEdkFhWlI0T2tUcFQ5cEdkUjZkODFwOXFlWGFi?=
 =?utf-8?B?K0dkcDhzM0ZxdVlmeWV0Y2xSb3RkYUVxcGhsYWlYS1BhYUk3cWcvdzFDTW80?=
 =?utf-8?B?VUJKRmduNXZCMnJoV2JHdlpycm9kaldHMDRnQWlsZDIwZEhEZWRKWTFxYTRK?=
 =?utf-8?B?VXZCbzZGaFlheENEb2FMZitFUFFkYTVRMTdWYzBJaDJZV1FLRERFRFdkT0oz?=
 =?utf-8?B?R21LTlZKWmFmRHBTWVErckI2NTgzd3FQVXdycGptZ1VCS3J4a0FLbkptOWR2?=
 =?utf-8?B?ZEJ4UGxpbm9uSU1wNSs0YzRJRVl2dSs2THYzOE5RVTRIRkZwREhCQnEvZHpV?=
 =?utf-8?B?YzkzcDcyS0JZb0NrMnZETTFpbTJmakRXODlTME5IM29rN2tWWm5qVGZzMVZW?=
 =?utf-8?B?R2ZYbFRCdXA0L3Z0aTJnU0x4U1VaSWZjblY1MVlNakN3cUozYjdyY0tiRDVo?=
 =?utf-8?B?bE5ML3Q3RERHcmQzV2hOWUtDNEUzcWR4ekF4ajRGVW1LZGNOcUgwblNBUVRL?=
 =?utf-8?B?aU5wdGdMU2o1UkhQVmlIS0VmMW1haktoNXlneWRURHNnS2lrWG5BbTU5VGJB?=
 =?utf-8?B?bnhsbmFzb1FzQ0kwZ1pTMDFPRFVrM1pERFR3NEs4SjEweHM3MmR1aGRlMXJO?=
 =?utf-8?B?bGtFVXR0KzQxWkkyeDVlSHdudis1Q0RhSFVlbUJ2Y2k2THlSdXZOWUx3WVNV?=
 =?utf-8?B?blBlVnQ5MDl2Ri9DMk1RUmFCWTlPZ0N1Y2ovQ3k0QzVtcHFSejZIWGlwRmdK?=
 =?utf-8?B?c1RhVVpKcXFya05kVGI5OUY3dlg1RDJkWkpzeHg1YkZWZ21Bc05yczV6ZW0z?=
 =?utf-8?B?bWFUNWppSUd3MGhBd0NmYmZlb2xtS0REbTRHR09pcW5qd0ZySm9Yd3dhRVVH?=
 =?utf-8?B?cVRkdHhRdUxydndEVVdxYzE5RlJsU2NoZGJXUERNRUVSb2h4Y1JHNkNIemJh?=
 =?utf-8?B?VFpOQzlPZ3YrUGd6Ly8xQzhlMjVOQWhxcTM2blowUm4wS3hYNUZHcjIxcS9B?=
 =?utf-8?B?TkdOcWsvd0QxWk5RZWUxc0hRZ2RSWEdlLytXQW1QQ3pZUWlPM1kxNjFTdWhk?=
 =?utf-8?B?ajhVaEE1bXl2TzBWeU9rV0hxVGJEcjJub2VaQ2NxbTZHY3UwS1pxSjBteHZp?=
 =?utf-8?B?c2R2cXZXb25XSHd2Y2JldlFFRDk5bmNGbEIxVThPcjQrWkJLNFVqek9GYVhP?=
 =?utf-8?B?S0UyNG1TaCtVWkNaSlJXeHFTK1BqbmNwZXdPd21PcVRUOXp2UG9hZUF5WkU2?=
 =?utf-8?B?aVVZTE91dkt6bnJoSzNycDVNSGFUZzlDV3RIby95VWJ6dkMxb3l6UCttK0Fr?=
 =?utf-8?B?aWJ2cjlSRG1GV0IxUTlxRzViMjBQaUl0akpyNGRkZEpkMWFWLytiL2ExTEZD?=
 =?utf-8?B?OUJueSthSWtKMHU2clpiSnAvcEYxVEFEbUNRWURXdWxnMHkrZjd1Q1Y2MU1R?=
 =?utf-8?B?eGpacUNMRWtFZzZ4Y2YyWjVweHVXRlNXNkFaekVwa1AxSzFaSUxKOWo0NDlF?=
 =?utf-8?B?T25TbHlkaGVwY0h1Z1E2MnNNVFN5YUV6UTR4TzVYb2NzL2Z4dGp2dGdBb1Zz?=
 =?utf-8?B?VHZpb0l2SDlVQzlxY0FlZmtlazZwTWpJb21lenlRS3ZwWkNxYmkxejE0b0dN?=
 =?utf-8?B?TVBFVTk2NXQ1M1Z1OWt4Wmo2cDZrdWNkb1FaY0FMalZETUl6RURESUJHYVoz?=
 =?utf-8?B?bGpsbWp6ME9SekNDY3RlR04xaDJodGRzNDBadDlIRDVRd0VIR0N5OEtmTGhj?=
 =?utf-8?B?M0RmMzU2Q2x0WTlleUM2RmFzUE8wTVVPMXdZaDk2NkVQSzVEVlpxaUNlekIx?=
 =?utf-8?B?OW00ditPTSt5aHh5ZlArNjRTTG1Kb3d0eDAxN1J4SDVWbkc2K3U5d0pMRlVF?=
 =?utf-8?B?QlRRM2VhQnc2V2g2bmYzakd1SEg0MUFuU0tMZ2toUTVJVG80YmlTTWlwSGI5?=
 =?utf-8?B?WmMrUW53QWNBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR18MB5368.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEI1eUJKR2hYdEs0ZGVBcFZqODFOdWlla2grSnJYeEt4Q3hGYmNHeDViNVhC?=
 =?utf-8?B?MnlOV1dVc2h6ckM0VmNVMmFBVnl2aUdsM3FOOUNRak5TUkk0Ni83aC9KWEt2?=
 =?utf-8?B?ZnZLRzdPSUJORjNlaTBDbEIvSHZVSnZQeCtEa05NSGlpZEVhTTYxNTB2R0dF?=
 =?utf-8?B?WGVqd2dYR0ljMmkrdDJlR2QyYVltU0hZUGZtbE4zcHU1a0xYRVdzMXRtZUMw?=
 =?utf-8?B?KzRVa0RWdHRsbnFVREYvY2tqamJsSVI3aGxFUXNkVFgzbGhYMWdWNmY1MlZ1?=
 =?utf-8?B?S2ZCUUNXRVdOMnRhakR6Snl3YXFyWXRPK2pkQWVCQWhXSVVOaEdXSVNTODds?=
 =?utf-8?B?WGwvd0FNZW0vMGJyL0w4SkNPZk9Xb1VWOElsREtobTVFUzVpQXRjUFM4MERo?=
 =?utf-8?B?Y2tPYVhkMDkxdGZPR1N2cGVWZ3YxaHp5UWg5Z2lYRU4vVjE5OGVWelR5TlRP?=
 =?utf-8?B?MDVoMUNSTlo3dGtrZTQ0dnE5bERNMytCNHU0QlVTS1QxWjR2K0hRZHJkVnJt?=
 =?utf-8?B?T2lCZEd6SlZoUWExT2VWWW82bmR3RWliQVNsOGY2cmlRM3dMakgvUE9SaEd5?=
 =?utf-8?B?TW83WTZUeWJheXRIOGkyblNBTGtMbFVkdnNFaitCUElqL1JsbHBXYWRTeUs5?=
 =?utf-8?B?VEsyYlJuMTdRbnMzYzVZSGZuUnlKRXlZdVpkSm5MOERkUGI4ZC93MitEZ1B3?=
 =?utf-8?B?aFV6QmF1RlFqV1U3c1NGa1dkNHZEL0k3VC9IWjdXZGZmeHExYmduWCtYbVpt?=
 =?utf-8?B?anRJQXBEdGlKKzlWSGRMWWRzYm5nUzk1R2x5SWY5alhOc0V3KzhDK2ZDbEho?=
 =?utf-8?B?QlNHZURLMUJETXJRRzh0cEFQY0ZkNW5IZDZKWTdhNm1ZeUJuUjc2di92dURO?=
 =?utf-8?B?b2JDZTBaTEgxNkY4VTN0MnhQLzN3WFNzZzZKaXE2elNKUzhSSTZ3K0hLbGdI?=
 =?utf-8?B?LzlGTWZPWFVXaUIxSFBORHlSNWQvVVRYVjZOOVhaUllYM3NNSUVPZ3kvb2lt?=
 =?utf-8?B?c3YrVHFLbmxEaXdtcU1vbXpnMFVtV3dSSmZHZzNnNVlKQ1pCUGd1N2tPZTk1?=
 =?utf-8?B?eGVQWCtnUmY3aHhBVEVibmx6ZFdnOXZ0R3RaWlVUN1g5YkxBanJmRHBJMUgy?=
 =?utf-8?B?MnU2ZmpzdVMzYUFER2dLSjhtWXJIM1hhZ3lJU1R3eTkwT0ZzV29ac2dQZ2Jp?=
 =?utf-8?B?OEFkNmlsbmxYWTIvaHZuNVJaODNvcytCRVZzbm1vYmRsaVpHWDk2MVRPR2Vt?=
 =?utf-8?B?eGU2WVlNVWxaSDh4NFBaTHNRY09ERFVyOUNMYm01RUhLcnZYWjRQdmt2VFpU?=
 =?utf-8?B?L09mNlJTd2FCME1oS2VCQnRyMzVJYmR6Qm5LQjA0YUhmWWFuRUk4MnVvZXps?=
 =?utf-8?B?TjhhaldOQzdTTDZWZ1REQXdBUlJHYWdIbmxKVlJYeElnMWErTmxCVkJlTlAx?=
 =?utf-8?B?TkhrTk94Z2ZRbmtmcFo0aTMwTmlnWXNqeHF1ZkI1VHlZajNHTTFzSFA2REZP?=
 =?utf-8?B?MlhMY2pacFRrdUMxd0dsOU15WjE5cnF4V2dyUWNhV3hGdDdKUlN0WmZoSUkr?=
 =?utf-8?B?NUErM25sWXNIYnpjc0I4b2NyUmg1ZjZsTHAwdzJzZzJnQkRpM3h3UVFGdnps?=
 =?utf-8?B?VTR4bU5GdnRRL0w1Yi85Y3VLQWIxa1p5SW9rSytyTXZEWXg3WHJzanJ6dU14?=
 =?utf-8?B?d3JRNUtmZkMrQ1UxNExHVTVhZUF3bXJ4TzB5SDROSzRBOVIzOUthNUl1T3VL?=
 =?utf-8?B?SjlwY2h0WkJ4cDA4WnJ0Y0hWQlBnMkhoU2p6WTZwVkJDd2o5VGl5Z2tpNUpO?=
 =?utf-8?B?YlZmbFQyUzk4NUorZXRPak11MEZhdENHc2hGWWhjcC9JOUZCb1FmdnBxTEhQ?=
 =?utf-8?B?WkFHM1Z5Zkl5alc0UjFHZ3FXSDQ4bEZ2M1QvYkZuMFpUY1lZclFlN0F5Tk83?=
 =?utf-8?B?azdrSFZrOTdTVk9MTjNUSEZVcFVqUTQwU3ZDbTQveFQ4Rlh2VFdlL2FqazNO?=
 =?utf-8?B?UFhEOUhjQnkxcW1Uc0FXRkpYK1VjZmNWOVBHNC9KQVNKZStEaHFFMytMUDdy?=
 =?utf-8?B?TlNlTWtRb2ZuR3V4UGxCN0F0MVJHL1dEaDBpTkJOWHc0SFV4QytMaVQxVHZ4?=
 =?utf-8?Q?eyyE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR18MB5368.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b89144-c044-4bc5-fa42-08dd8656b68a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 13:15:14.3993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUOvLF6VP74L1gCSF/icFbJwZfWsT19JrTs4o5SbfG6dQGLGvaH6pTAkKopiJxkd7mZ1Qnhv9wsICKccE+/JOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6143
X-Authority-Analysis: v=2.4 cv=aeVhnQot c=1 sm=1 tr=0 ts=680f7f66 cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=-AAbraWEqlQA:10 a=5rqlqqaZn6kYzM7ytYMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: NUyLLtKYhfOruu0KUsbWUEnEOA3o6_pY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEwOSBTYWx0ZWRfXxaC6FZ36YzpA wsAu892Z8K/q6o2e3dzF3aML+JIPPlgHQtEHnCN+bA3YQVuCvFn97QURDU/kCiZlFGBWm49y+kJ 5uhEk3gD1QZUqyBqH6NvsWPJ11dXSHrNXXs9Y9YdtFfYH561xwRjVb1YLl2PbhOALhfqNiAhJLD
 K6Q/z+ZX505YmD5PRtZXxzL1FXXEZv/h7XT0AwiCdb/0KeKs2idSc4PGiobe3MfTtZzxVvnv2A5 Epzta9jy+FEsAcr2qU7H6/cB41p/KQhVRgOSdlD+JFUuZeXs8CaMYMM1Lc+/ER3SuiRQXAKfNB1 YggzlktBs0/dGdAhw2FtUiU040Mg2xGLC1dlhOnq+pxbticI1EOYC5tpYo3TGAtfKkPK9O38L9p
 G0fW8i545Mv7xuQUlzQGHSu8bODgDm9tdJs1YGHHIqBGsmbPdu7DUPlmu9Gl+2R2M/DP6S5o
X-Proofpoint-ORIG-GUID: NUyLLtKYhfOruu0KUsbWUEnEOA3o6_pY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01

PiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAwMzowMDo0MlBNICswNTMwLCBTcnVqYW5hIENoYWxs
YSB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBlbmhhbmNlcyB2aXJ0aW8tY3J5cHRvIGJ5IGFkZGlu
ZyBzdXBwb3J0IGZvciBJUHNlYw0KPiA+IHNlcnZpY2VzLiBUaGVzZSBwYXRjaGVzIGFpbSB0byBl
eHRlbmQgdGhlIGNhcGFiaWxpdGllcyBvZg0KPiA+IHZpcnRpby1jcnlwdG8sIGVuYWJsaW5nIGl0
IHRvIGhhbmRsZSBJUHNlYyBvcGVyYXRpb25zIGVmZmljaWVudGx5LiBJbg0KPiA+IGFkZGl0aW9u
IHRvIHN0YW5kYXJkIGNyeXB0byBwcm9jZXNzaW5nLCB0aGUgSVBzZWMgcHJvdG9jb2wgcHJvY2Vz
c2luZw0KPiA+IGlzIGFsc28gb2ZmbG9hZGVkIHRvIHRoZSBDcnlwdG8gZGV2aWNlIGFzIGxvb2th
c2lkZSBvcGVyYXRpb24uDQo+ID4NCj4gPiBJdCB1dGlsaXplcyBuZXcgdmlydGlvIGJhc2ljIGZh
Y2lsaXRpZXMsIGluY2x1ZGluZyBjYXBhYmlsaXR5IGFuZA0KPiA+IHJlc291cmNlIG9iamVjdHMu
IEJlbG93IGlzIGEgc3VtbWFyeSBvZiB0aGUgY2hhbmdlcyBpbnRyb2R1Y2VkOg0KPiANCj4gcGxl
YXNlIGRvIHN1Ym1pdCBhIG5vbiBSRkMgdmVyc2lvbiBiZWZvcmUgeW91IGFzayBmb3IgYSB2b3Rl
Lg0KU3VyZSwgd2lsbCBkby4NCj4gY2FuIHlvdSBleHBsYWluIGluIGEgYml0IG1vcmUgZGV0YWls
IGhvdyB5b3UgZW52aXNpb24gdGhpcyBpbnRlcmFjdGluZyB3aXRoIHRoZQ0KPiB2aXJ0aW8tbmV0
IHBhdGNoZXMgeW91IGFsc28gcHJvcG9zZWQ/DQpUaGVyZSBpc24ndCBhIGRpcmVjdCBpbnRlcmFj
dGlvbiBiZXR3ZWVuIHRoZSB2aXJ0aW8tbmV0IGFuZCB2aXJ0aW8tY3J5cHRvIGRldmljZXMuDQpJ
bnN0ZWFkLCB2aXJ0aW8tbmV0IGxldmVyYWdlcyBjZXJ0YWluIGRlZmluaXRpb25zIGFuZCBzdHJ1
Y3R1cmVzIGZyb20gdmlydGlvLWNyeXB0bw0KdG8gYXZvaWQgcmVkdW5kYW5jeS4gSGVyZSBpcyBh
IGRldGFpbGVkIGJyZWFrZG93biwNCjEuIFJldXNlIG9mIFJlc291cmNlIE9iamVjdHMgYW5kIGNh
cGFiaWxpdGllcyBEYXRhIFN0cnVjdHVyZXMNClZpcnRpby1OZXQ6IFV0aWxpemVzIHRoZSByZXNv
dXJjZSBvYmplY3QgYW5kIGNhcGFiaWxpdHkgZGF0YSBzdHJ1Y3R1cmVzIGRlZmluZWQgaW4gdGhl
IHZpcnRpby1jcnlwdG8gcGF0Y2hlcy4NClZpcnRpby1DcnlwdG86IERlZmluZXMgdGhlc2UgcmVz
b3VyY2Ugb2JqZWN0cyBhbmQgY2FwYWJpbGl0aWVzIHRvIHN1cHBvcnQgSVBzZWMgb3BlcmF0aW9u
cyB3aXRoaW4gaXRzIGZyYW1ld29yay4NCjIuIENyeXB0byBBbGdvcml0aG0gRGVmaW5pdGlvbiBN
YWNyb3MNClZpcnRpby1OZXQ6IFJldXNlcyB0aGUgY3J5cHRvZ3JhcGhpYyBhbGdvcml0aG0gZGVm
aW5pdGlvbiBtYWNyb3MgZnJvbSB2aXJ0aW8tY3J5cHRvLiBUaGlzIHJldXNlIGhlbHBzIG1haW50
YWluIGNvbnNpc3RlbmN5IGluIGhvdyBjcnlwdG9ncmFwaGljIGFsZ29yaXRobXMgYXJlIGRlZmlu
ZWQgYW5kIHVzZWQgYWNyb3NzIGJvdGggZnJhbWV3b3Jrcy4NClZpcnRpby1DcnlwdG86IFByb3Zp
ZGVzIHRoZXNlIG1hY3JvcyB0byBzdGFuZGFyZGl6ZSB0aGUgZGVmaW5pdGlvbiBvZiBjcnlwdG9n
cmFwaGljIGFsZ29yaXRobXMuDQozLiBDb21tYW5kIFR5cGUgVmFsdWVzDQpDYXBhYmlsaXR5IENv
bW1hbmQgVHlwZTogVGhlIGNvbW1hbmQgdHlwZSB2YWx1ZXMgZm9yIGNhcGFiaWxpdGllcyBhcmUg
ZGlmZmVyZW50IGJldHdlZW4gdmlydGlvLW5ldCBhbmQgdmlydGlvLWNyeXB0by4gVGhpcyBkaXN0
aW5jdGlvbiBlbnN1cmVzIHRoYXQgZWFjaCBmcmFtZXdvcmsgY2FuIG1hbmFnZSBpdHMgY2FwYWJp
bGl0aWVzIGluZGVwZW5kZW50bHkgd2l0aG91dCBjb25mbGljdHMuDQpSZXNvdXJjZSBPYmplY3Qg
Q29tbWFuZCBUeXBlOiBTaW1pbGFybHksIHRoZSBjb21tYW5kIHR5cGUgdmFsdWVzIGZvciByZXNv
dXJjZSBvYmplY3RzIGFyZSB1bmlxdWUgdG8gZWFjaCBmcmFtZXdvcmssIGFsbG93aW5nIHZpcnRp
by1uZXQgYW5kIHZpcnRpby1jcnlwdG8gdG8gaGFuZGxlIHRoZWlyIHJlc3BlY3RpdmUgcmVzb3Vy
Y2Ugb2JqZWN0cyBzZXBhcmF0ZWx5Lg0KPiANCj4gDQo+ID4gUGF0Y2gxOg0KPiA+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlcyB0aGUgZm91bmRhdGlvbmFsIHN1cHBvcnQgZm9yIElQc2VjIHNlcnZpY2Vz
DQo+ID4gd2l0aGluIHRoZSB2aXJ0aW8tY3J5cHRvIGZyYW1ld29yaywgb3V0bGluaW5nIHRoZSBu
ZWNlc3NhcnkNCj4gPiBjYXBhYmlsaXRpZXMgZm9yIElQc2VjIG9wZXJhdGlvbnMuDQo+ID4NCj4g
PiBQYXRjaDI6DQo+ID4gVGhpcyBwYXRjaCBhZGRzIHJlc291cmNlIG9iamVjdHMgcmVxdWlyZWQg
Zm9yIHByb2dyYW1taW5nIElQc2VjDQo+ID4gU2VjdXJpdHkgQXNzb2NpYXRpb25zIChTQXMpIGZv
ciBib3RoIGVuY3J5cHRpb24gYW5kIGRlY3J5cHRpb24gcHJvY2Vzc2VzLg0KPiA+DQo+ID4gUGF0
Y2gzOg0KPiA+IFRoaXMgcGF0Y2ggaW5jbHVkZXMgbmV3IG9wY29kZXMgc3BlY2lmaWMgdG8gSVBz
ZWMgb3BlcmF0aW9ucywNCj4gPiBmYWNpbGl0YXRpbmcgdGhlIGhhbmRsaW5nIG9mIElQc2VjIGRh
dGEgcmVxdWVzdHMgd2l0aGluIHRoZQ0KPiA+IHZpcnRpby1jcnlwdG8gZHJpdmVyLg0KPiA+DQo+
ID4gUGF0Y2g0Og0KPiA+IFRoaXMgcGF0Y2ggc3BlY2lmaWVzIHRoZSByZXF1aXJlbWVudHMgZm9y
IGJvdGggdGhlIGRldmljZSBhbmQgdGhlDQo+ID4gZHJpdmVyIHRvIHN1cHBvcnQgSVBzZWMgb3Bl
cmF0aW9ucy4NCj4gPg0KPiA+IFRoZXNlIGVuaGFuY2VtZW50cyBhcmUgZm9yIHByb3ZpZGluZyBz
dXBwb3J0IGZvciBJUHNlYyB3aXRoaW4gdGhlDQo+ID4gdmlydGlvLWNyeXB0byBkZXZpY2UvZHJp
dmVyLCBpbXByb3Zpbmcgc2VjdXJpdHkgYW5kIHBlcmZvcm1hbmNlIGZvcg0KPiA+IHZpcnR1YWxp
emVkIGVudmlyb25tZW50cy4gV2UgYmVsaWV2ZSB0aGVzZSBhZGRpdGlvbnMgd2lsbA0KPiA+IHNp
Z25pZmljYW50bHkgYmVuZWZpdCB1c2VycyB3aG8gcmVseSBvbiB2aXJ0aW8tY3J5cHRvIGZvciBz
ZWN1cmUgZGF0YQ0KPiB0cmFuc21pc3Npb24uDQo+ID4NCj4gPiB2MjoNCj4gPiAtIEFkZHJlc3Nl
ZCB0aGUgcmV2aWV3IGNvbW1lbnRzIGZyb20gTWF0aWFzLg0KPiA+IHYzOg0KPiA+IC0gQWRkcmVz
c2VkIHRoZSByZXZpZXcgY29tbWVudHMgZnJvbSBQYXJhdiBQYW5kaXQuDQo+ID4gdjQ6DQo+ID4g
LSBJbnRyb2R1Y2VkIENPUFlfREYsIEVDTiBhbmQgU0EgTElGRVRJTUUgdG8gdGhlIFNBIG9wdGlv
bnMuDQo+ID4gLSBJbnRyb2R1Y2VkIFNBIGxpZmV0aW1lIHRvIHRoZSBTQSByZXNvdXJjZSBvYmpl
Y3QgZGF0YSBzdHJ1Y3R1cmUuDQo+ID4gLSBTZXQgY2lwaGVyIGFuZCBhdXRoIGtleSBhcnJheXMg
dG8gZml4ZWQgc2l6ZXMuDQo+ID4gdjU6DQo+ID4gLSBBZGRyZXNzZWQgbWlub3IgcmV2aWV3IGNv
bW1lbnRzIGZyb20gUGFyYXYgUGFuZGl0Lg0KPiA+IHY2Og0KPiA+IC0gVGhlIGVzbiBmaWVsZCBo
YXMgYmVlbiByZW1vdmVkIGZyb20gdGhlIElQc2VjIFNBIHJlc291cmNlIG9iamVjdC4NCj4gPg0K
PiA+IFNydWphbmEgQ2hhbGxhICg0KToNCj4gPiAgIHZpcnRpby1jcnlwdG86IEFkZCBJUHNlYyBz
ZXJ2aWNlIG9wZXJhdGlvbiBhbmQgQ2FwYWJpbGl0aWVzDQo+ID4gICB2aXJ0aW8tY3J5cHRvOiBB
ZGQgcmVzb3VyY2Ugb2JqZWN0cyBmb3IgSVBzZWMgb3V0Ym91bmQgYW5kIGluYm91bmQgU0FzDQo+
ID4gICB2aXJ0aW8tY3J5cHRvOiBBZGQgbmV3IElQc2VjIG9wY29kZXMgdG8gZGF0YSByZXF1ZXN0
DQo+ID4gICB2aXJ0aW8tY3J5cHRvOiBBZGQgZGV2aWNlIGFuZCBkcml2ZXIgcmVxdWlyZW1lbnRz
IGZvciBJUHNlYw0KPiA+IG9wZXJhdGlvbg0KPiA+DQo+ID4gIGRldmljZS10eXBlcy9jcnlwdG8v
ZGVzY3JpcHRpb24udGV4ICAgICAgICB8IDUxMCArKysrKysrKysrKysrKysrKysrKy0NCj4gPiAg
ZGV2aWNlLXR5cGVzL2NyeXB0by9kZXZpY2UtY29uZm9ybWFuY2UudGV4IHwgICAxICsNCj4gPiAg
ZGV2aWNlLXR5cGVzL2NyeXB0by9kcml2ZXItY29uZm9ybWFuY2UudGV4IHwgICAxICsNCj4gPiAg
aW50cm9kdWN0aW9uLnRleCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICsNCj4gPiAg
NCBmaWxlcyBjaGFuZ2VkLCA1MTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IC0tDQo+ID4gMi4yNS4xDQpUaGFua3MuDQo=
