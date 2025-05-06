Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D5526B95D
	for <virtio-comment@lists.linux.dev>; Tue,  6 May 2025 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746543628; cv=fail; b=vDsFO+TFK1RosNRNQ5vH05TNFaWF5+/uz+4gGIhxqt+2SPAv3ifg6XUjE46J6bjnVRba9H1oHis4AxwkvuF9kSxOVasHsF0aabcv6tccu2V1qstNyQWLRY06M0+ZU/MrLb9fg/aepDYrCPKITSEKjY1mCpvRJRu12yjHnrbUBus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746543628; c=relaxed/simple;
	bh=7BWCnWXeu/m02/7+bruu57Q602haCLKDLVH3BA2d2/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ky49ppYLvWS6tVN5O0WFhdlIGDuxG6So7C0skZ/XC8iIP51EBhA5YvLXkOoF1tkT1jjhs1ISRnTxsqVefrof6vMR6euwSD6qb5bKS1kj1UtgnHVzJf+wfraG4g1MaP8eBSJkuMfSjcBwOHeNpFeZy9QrPH0i091VvVR3d2BozTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J6AWju+O; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J6AWju+O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxroN7co5+wVrcz0//St2kMaMisMSn0QKJzahC21chfiJ3iTnx0BXt+JciimebCYleYDIIgaf+RN5h1g3/w1MM48RQzuRxVSIT259F2vfSTd48VMYuhHrOp85oT0YnGEneuEjeFIeljX/Ep7u5fkfi0+qOzvy/nEPME3/q5C9I8XmS6SAd5DOlUc0WL8Yfzbha35GS6VuSbPJu4QjUtXxQY46/G4BCvYqtkoZMGTe1/LZeOxYKuKwCAB71ggi03JJNPiSMbD0zu1SHgUEESH57E/FjpsAt6NUxK5HYFGRFIlVMROwNZ7EArAL82MvH+R0px+Q1P22kBrENu+0kpMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BWCnWXeu/m02/7+bruu57Q602haCLKDLVH3BA2d2/U=;
 b=aM5u9BBcluZu9m7w5Kltt5HUYh6JD7nr/vFWLAmzDBzm+U3k6e4BQsvdemr8jhimmoLUztkliK0t12JhuBRpA//Bw8c7+sGiQZIizm2v4NhCIjA64E5lInDukiZx7pjddUkdMknHP4KaOj93bXdM7ayqFn7BaSgs+3StlzniBupoLhU6426kpJXWVLuNfhWFWhVPMs5FdCr6QZsDaAYCnh9fbEQ2U1jC/1cbpTR1bobMNPn2JmNUO6ol/STgDwfMy6d6oi4e3ZwkauM48SKgM42A2aynPValjW5yU+oYyr9Hzl9dBZcmriWbqOSiOFDXPIL94w8pTLBoC2PA71825A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BWCnWXeu/m02/7+bruu57Q602haCLKDLVH3BA2d2/U=;
 b=J6AWju+OvBnYtAeIYsY4TNYRyny1791QUmS/YKno2xtcTsidgtiBeTjh8YeR6xGJbWYSXGnVUZEncFywT0lCM+wZrdA0jm5KRqXO03+ecfF2B2NnKfWv2VicLaWebgrlgBimb+osHIIhaNQF/GOiBVprsvLQMuGY22yCRa/UXURRhrHYqBtG1IadrstaBBm19gXfMVeycCVgRCUSS9ejp3ZIWADxJmNGsQMP9qKPMg7zHqEEaF7o5O7kUM6mEw57h7JgRNHUrX6qnpsslDj1GTwN9sfWinpCEkS7oWRR1xv0A5Cy/6uzewUZQUa7C+6DcAX5HpKLtdJ6I7RKMPtMYA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.22; Tue, 6 May 2025 15:00:18 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 15:00:18 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Jason Wang <jasowang@redhat.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Willem de Bruijn <willemb@google.com>, Daniel Verkamp
	<dverkamp@chromium.org>
Subject: RE: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Topic: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Index:
 AQHbb7qQTK1IFlk3mUyW0rZK+XznHbOwfmOAgADIVQCAALOCgIAAG2mAgAc9KICAAlyQAIAAgdHAgABgHoCAAAjkMIABxDWAgAdaTsCAACB8gIAAEGTggABgHYCAAAQDQA==
Date: Tue, 6 May 2025 15:00:18 +0000
Message-ID:
 <CY8PR12MB7195FC058918DCC17E56FF80DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
 <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250501093933-mutt-send-email-mst@kernel.org>
 <PH8PR12MB7208BA2F9A48EEBF42B15AE0DC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <20250506035434-mutt-send-email-mst@kernel.org>
 <PH8PR12MB720860F36BE0C9E7C1C35A0EDC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <862ef83f-9ed8-4d50-85ca-36231e93514a@redhat.com>
In-Reply-To: <862ef83f-9ed8-4d50-85ca-36231e93514a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB6349:EE_
x-ms-office365-filtering-correlation-id: 49972a6f-1bee-4289-2024-08dd8caeb75f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eHFRRitSL1ZTRzltZ1lFSEJpbWhxZUdnU2RPSHgwd0RNMmpvRGVMcVVWZU16?=
 =?utf-8?B?eTlsQWFXazBvSUxxUkMzak8veXN2aUFPekJDYlZSU0ladWpUdTRiVFlNeEla?=
 =?utf-8?B?WUNDSHlLTkpBdWp5V2xNbXdRdWtodnhUTTBNSEhac0ZQQVozRVI5QUxoZ0Q0?=
 =?utf-8?B?UUx1d1AwY2kxMXJqUFdMMG5UUFVxUXpkV2hyV1NsRHB2aVFZOGVieG9vVG9o?=
 =?utf-8?B?QTYwN1VPQ2tDMUU1dUdqcHlQTWFYMHNyeHJidnZNOHgxYW8velVFN25rU21C?=
 =?utf-8?B?L3hLOWJXcEdNSkZGTWxvU3ZJdnprS2Y3NjN0K3VjQUhkZjg1UGNaby9rNEpq?=
 =?utf-8?B?RmxudW5mNHBiS28wZVpmd1BPM0RkKzVCd1hQU0xLV0dLbVhtZmhBRmRsSU8r?=
 =?utf-8?B?ZFFzSmRFUjFPZUwwZXlMVHVtd2xZZzRlQ3J5NFdBVzhCR3M5elhELzhDclhl?=
 =?utf-8?B?UXhyMi9OVTg4Q1E3UktrZ3l5cjVIZlE4OSt6VUJldnVVam03VDQzRzFQZFVE?=
 =?utf-8?B?LzRuWko2djBiVU9XK3VYV2kxWFNwbG9FSXZPemhtenJod3J1MDRiRVA4a0Jm?=
 =?utf-8?B?WmRaaE01Vk5xMDBXT0NGaWJaUTZLakZvSzFJbUREVVN1RGY5bktvOWZMSys5?=
 =?utf-8?B?ZlRxNzVrbW1BOERqVFJyT3B0Z0w0TUVtdiszbjRHSzZiQnpDbGJML0NGbkhn?=
 =?utf-8?B?dXFtRkpPdC9neWZvazhTNlVEK2hzVjhpRjc1S2FPcVRadXl4NUpIRVU2NGt4?=
 =?utf-8?B?K3hZK05nQXdaa2NDcGdPaXNaVTBzdEliTnBUUm5vZ2pyQTczenpwMEp2YjJz?=
 =?utf-8?B?Mm5Ea3lGOWlxSkhpZ3hmT0t5RlFEQVhIOTNwOTNvRDg2Q0NOVlBQOXh3SDhP?=
 =?utf-8?B?K2M3enZPVDEvZ0xJK2h4WURNTVBWaTVKNXp0cjRSVXRFOTNpbXBMNXhhZXlI?=
 =?utf-8?B?dEdRcnZTMk82eUVLNTJHektqbm45L2RzOEI5N08yN3lncDBYR0pEWk5NSUJF?=
 =?utf-8?B?ME1jY1gvU2hUUU5GUTNSV0R0cTBMbDlBUWU1bTJoUzV0Nnh4bkcvWEM4aWt4?=
 =?utf-8?B?RHB4TGw0L3JVS251VitrYXJGbGxPVDc1b2xKaVVmeHo0Rm1NYk1RcmlTd3dU?=
 =?utf-8?B?ejhibGhLdVUxVkUyYVBQbWVjNXgxQXhIcGNzZXRsSHF4SGlSNm5VN1Y4Vzdw?=
 =?utf-8?B?WGNEQWRWZUR6MnFrY3RROXI5OXlJMjB4bkRyZENINjFzWjJJL0VveUgva1dv?=
 =?utf-8?B?em9BZklSMXM5TExzL0wzZjlUeC9qZnNHWTlKWXVvS2RKTi9qYSs2cVR4b0Nu?=
 =?utf-8?B?c1JoUzhHc254UDdxek9sMGc5OUFGUEoxL1hIR2RSYmxUdTVmdS9sTkFUZGFn?=
 =?utf-8?B?RmYzcHBaWDZWRlNyM1diM3lsdTFFUFJLakdpSThWYy9lOGxpQ0VseCs3dUF6?=
 =?utf-8?B?WWV0VHBWTWsxYlh2c21vM1ZLakJaZlZhV2dpLy92MFcyNWV5bGtlMVMzdVJI?=
 =?utf-8?B?OGxycXc3ZjQ3ZXB0MVdUanY0UEV5Q3pnSlpKbnJFbkR6R3ZRSmxRanNnZEM1?=
 =?utf-8?B?ZHZjZGkvdlRjS2IzYmZMdEVocyt6MkZoeUJwTWpjS1FaSHR0SkJuZ2JJOGRz?=
 =?utf-8?B?L2N0RmtDTGxvTmhTY2dOaEtkSlNOWVZRRzJRMnBIQlg5RFFDaXpFYWF3cExy?=
 =?utf-8?B?Zkd0eGNRS0tiT3IzQnB3UUVaUW1EMW0vbksrSkRna3VVb1h5SG1jNk5TZTg4?=
 =?utf-8?B?a2tYQTRLbWFZQThBZXhGa2x4K2owek0zVDUySDZ3b1JTZVhYb28yV1JwS29Q?=
 =?utf-8?B?SDNVNVU1NVpOSWZZQ21YRGJ6ZmkxRys2NnRUcnM1Z21LNld4Ym5ZTE1Pejk0?=
 =?utf-8?B?K0FieTNUeGRIVVMwT1J2QzRBbzlBUE9OQ0k2cStRNitXQXVYQW5ZN1U1UGxL?=
 =?utf-8?Q?zlr5bzmBgu0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3Q1U01zdWZVbnZraGllVFFNWmhjOFQzYkcwVDdvMlk3QnF2LytSSHpaSmpi?=
 =?utf-8?B?TjJ6TjVXVUxJSHhMOEFGU0RQSVR0MTc1eWc0T3NCQXh3NmgwVWRSWTd3aEVD?=
 =?utf-8?B?L0NBVUJRN1JoNWMyUjNHN01CeGpmQ0djcERMNFZWMW9Ea3NlaStQMHRPNTZK?=
 =?utf-8?B?S1BZaFNRaHdtNUZFVzNyTG03RS9QL09HVnNuMGhyb09TVEFiK3U0K05Nb2ZL?=
 =?utf-8?B?YXFRRFFWSTN1SHRoOTFoVWhIWUMxQ0d2dVUrQzc5Uyt4bjJtc3h4M3Z2Ky9t?=
 =?utf-8?B?aFByWjk3RHp6ZHFRV3h3OTNpcFpVZEY3M2FOWldDb2VQblJ4RFFrUDVkNmpq?=
 =?utf-8?B?dkJ0RHphMUVmTHlkcVVXTzJ1d3U2UGUwMFJiUzhHREVpK0VPYlQ4WEs2U203?=
 =?utf-8?B?S1JLMmhWTHBSV3dyZlNDTXBEUnExTzhKRHlYcnNsQnhNcVEvN3pUMEJsUUxD?=
 =?utf-8?B?b1FDYUVMVEovZnljY0FxcENGUDBPczZid0JPSEE1MnVzcG51N3VtdUxZK1cr?=
 =?utf-8?B?bUNpS29ENGY2cFAzR01ZVTVxOFdBOEc3cTMwOExwazVNQkVHM04rSGNCcHFU?=
 =?utf-8?B?VU9RTjZyTmlzYU9uUksrTzlIa1JUalhXakpFVHk5eWFGQm9ZbTlhRytBNUoz?=
 =?utf-8?B?a1hpMkVxS3BtTUI5dEloMFJmUWlOSkh5bHhFd1dtM2pqMFFFbDRONzBMN2JJ?=
 =?utf-8?B?Z1B2T2lYQmJJbGtZTmx5NVRib1lBanlud3EzbW9EYVZqRXZUbk4ydEEzNjlO?=
 =?utf-8?B?QlNiNW9LSjNaRzl0UFovTDBmd2thalRZZzFLNXBnOC9kNW4xa3hYdzRIcTNs?=
 =?utf-8?B?dDYvaWdPTm94TGZSU09DOExodmtPcnh0bkwyYlVmUUZxVXBIK0ZDeDRqMENJ?=
 =?utf-8?B?WWhzNFQ3VnZHUks3cE01K2F2aW1ocW10czVRWEw1SWNGdFk3cXljTGVVSHVs?=
 =?utf-8?B?aU9pVm9CVmN5QVF6VElabGxiK1l4Y3JzWVJmcUx3Vk92ODl6M3JTckN6WXdF?=
 =?utf-8?B?MDFFdVZQUkxKTHI4c3JCdVJnZ2piT09IZDF3NkdlWHA0U2d3RU5DR2dJNW9w?=
 =?utf-8?B?bnI4eENTTkR6UXI3WEhRR2liM0hDMklCVUJ2ay9ENFkxdnFSaHQ2WlF2VTg0?=
 =?utf-8?B?dkJrYkFJRjc0bGFreWg2TWJOSS9UbGQ2dkEvN0hQZXF5M3pyVHVFUjkwZlQy?=
 =?utf-8?B?b05FZ3dBR3kzSVVSZzJJOEtlc0MrZmgxeSt2TEpNVGRWUEx2Q3RBcEZUVFF0?=
 =?utf-8?B?b2tsSnZiVDBmRkFzWUU4L09XS2VIUFBuNVNlUWxTV0gwclhZQ2FBaDNtZkFZ?=
 =?utf-8?B?N0MxbmJGRXlvZGVGZjM4ZGhyZzZjTW1qeXhBQVA4OGRxbSs1aytvNFVxc2FU?=
 =?utf-8?B?bU53Qm9Rc1AyU2pDUTEyOENQakZTWmlqVjY2dE11aTRvcHQvVm0vRTNBOVVo?=
 =?utf-8?B?WXgzWmN1VzdGZnZLNXVQRTVrV0kxSmZLMzdPNzBNekhza3JDSStLTG0zNzcw?=
 =?utf-8?B?Sk5Xdng3ZVhNSkEzVnlvSUJwbEk2TE9ld2V3K2NYYW9uaGFIVm9jMUxrSTdL?=
 =?utf-8?B?aGFTMHVRdkR1SlYzc1hYbno3V0paV0NMWVFNbmR6SzRNQnNBbEV0QjBSQ0dq?=
 =?utf-8?B?Z0pPRlE5WWhOMVEyd09EYStjZEIzNWpodkVUaWRHUXBRZXhVQ1JHcXFldEp3?=
 =?utf-8?B?Uk1uNWovUWF5L0FtZnBCaTlSUHRFZEZKUWNMZ1BHWVNqTWZFNHJybTNEZ09P?=
 =?utf-8?B?N3dGT3o1aVM1aTI2a0NXY21CZCtEUE5ROFptNUg5eDl5WnhnZlZQUW9XNm5n?=
 =?utf-8?B?K3poWUd6RUpiSVdaRG54ZTZOUjRHMU15bWxnem8zLzlBbkVBREJVU2ltZC93?=
 =?utf-8?B?Z253SXF0cVczQjhicG5kbmhIbnBkMFYyQ2h0TWY2SkszeVZyLzhnRGdjS3VO?=
 =?utf-8?B?S2VLNDBVY0kzKzYzYzBwR1k4RmQ4UVJBNDR2WE0rRU9ObnhGY0lkZW1XdGpM?=
 =?utf-8?B?V2xoUm9iVFVGRXlKc01HS2x3NnE4SndYUkQzZitlUDVnT2I4MFdNRkZNY1pR?=
 =?utf-8?B?SktZQ3ZvK1dkKy9OcHdKa25vS2M5cXVVREcvdG9BWEpvVjRlOVZrcmd1aTBs?=
 =?utf-8?Q?KUoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49972a6f-1bee-4289-2024-08dd8caeb75f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 15:00:18.4862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yh1XG6AqX4Av0gzvMY9OfjleK+PbTvvLmKxKmG4WajGm1PyuL1E1Gq7d3O6FTJuKvdtHIHqPRhZrNu8DWNcGQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349

DQoNCj4gRnJvbTogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBNYXkgNiwgMjAyNSA4OjA5IFBNDQo+IA0KPiBIaSBhbGwsDQo+IA0KPiBPbiA1LzYvMjUg
MTA6NTYgQU0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogTWljaGFlbCBTLiBUc2ly
a2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgTWF5IDYsIDIwMjUgMToy
NiBQTQ0KPiA+Pj4gVGhlcmUgYXJlIGZldyBwcm9wb3NhbHMgb24gdGFibGUuDQo+ID4+Pg0KPiA+
Pj4gMS4gRnJvbSBQYW9sbywNCj4gPj4+IC0gMCB0byAyMywgYW5kIDUwIHRvIDEyNyBGZWF0dXJl
IGJpdHMgZm9yIHRoZSBzcGVjaWZpYyBkZXZpY2UgdHlwZQ0KPiA+Pj4gKyAwIHRvIDIzLCBhbmQg
NDYgdG8gMTI3IEZlYXR1cmUgYml0cyBmb3IgdGhlIHNwZWNpZmljIGRldmljZSB0eXBlDQo+ID4+
Pg0KPiA+Pj4gVGhpcyBkb2VzIG5vdCBoYXZlIGdvb2QgcmVhc29uIG9mIHdoeSBpdCBzaG91bGQg
c3RpbGwgYmUgMTI3Lg0KPiA+Pj4NCj4gPj4+IDIuIEZyb20gbWU6DQo+ID4+PiAtIDAgdG8gMjMs
IGFuZCA1MCB0byAxMjcgRmVhdHVyZSBiaXRzIGZvciB0aGUgc3BlY2lmaWMgZGV2aWNlIHR5cGUN
Cj4gPj4+ICsgMCB0byAyMywgYW5kIDQ1IHRvIDY0IEZlYXR1cmUgYml0cyBmb3IgdGhlIHNwZWNp
ZmljIGRldmljZSB0eXBlDQo+ID4+Pg0KPiA+Pj4gVGhpcyBpcyBhbiBleHRlbnNpb24gb2YgUGFv
bG8sIHRvIGp1c3RpZnkgdGhhdCBpbXBsZW1lbnRpbmcgZmVhdHVyZQ0KPiA+Pj4gYml0cyBpcw0K
PiA+PiBleHRyZW1lbHkgaGFyZCBldmVuIGZvciBleHBlcnRzIGFzIHBvaW50ZWQgYnkgUGFvbG8u
DQo+ID4+PiBJdCBpcyB3b3J0aCB0byBub3QgZXh0ZW5kIGl0IGZ1cnRoZXIuDQo+ID4+PiBSU1Mg
Y2FuIGJlIG5lZ290aWF0ZWQgdmlhIG5ldyBiaXQgNDQgaW4gZnV0dXJlIGJpdCBhcyBPUiBvZiA0
NCBhbmQNCj4gPj4+IDY0IHNvIHRoYXQNCj4gPj4gbW9yZSB3aWRlciB1c2VycyAoTGludXgsIGZy
ZWVic2QsIHFueCwgV2luZG93cywgZHBkayBwbWQpIGNhbiBwaWNrIDQ0Lg0KPiA+Pj4NCj4gPj4+
IDMuIEZyb20gbWU6DQo+ID4+PiBLZWVwIHRoZSBmZWF0dXJlIGJpdHMgZW5jb2RpbmcgYXMgaXMg
dXAgdG8gMTI3IGJpdHMsIGJlY2F1c2UgbWF5IGJlDQo+ID4+PiB0aGVyZSBpcw0KPiA+PiAodW5r
bm93biBhbmQgd2VpcmQpIHZhbHVlIGluIGhhdmluZyAxMjcgZmVhdHVyZSBiaXRzLg0KPiA+Pj4g
KHVua25vd24gYmVjYXVzZSB0aGUgcmVhc29uaW5nIG9mICMxIGFuZCAjMyBtaXNtYXRjaCkuDQo+
ID4+PiBJbiB0aGF0IGNhc2UsDQo+ID4+PiBWSVJUSU9fTkVUX0NUUkxfR1VFU1RfT0ZGTE9BRFMg
Y29tbWFuZCB0ZXh0IHRvIGJlIHVwZGF0ZWQgdG8NCj4gPj4gaW5kaWNhdGUNCj4gPj4+IGZlYXR1
cmUgZml0cyBBIHRvIEQgbWFwIHRvDQo+IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURT
Lm9mZmxvYWRzDQo+ID4+IGJpdHMgQScgdG8gRCcuDQo+ID4+Pg0KPiA+Pj4gSSBhbSBmaW5lIHdp
dGggb3B0aW9uICMyIGFuZCAjMy4NCj4gPj4+IERvaW5nICMxIGZvciBzdXJlIGlzIHdyb25nLg0K
PiA+Pj4gV3JvbmcgYmVjYXVzZSBpdCBkZWxheXMgdGhlIHByb2JsZW0gb2YgIzEgZnJvbSB0aGlz
IHRvIGFub3RoZXINCj4gPj4+IGZlYXR1cmUgW0FdDQo+ID4+IHdobydzIHZvdGluZyBhbHJlYWR5
IGNvbXBsZXRlZC4NCj4gPj4+DQo+ID4+PiBbQV0NCj4gPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3ZpcnRpby0NCj4gPj4gY29tbWVudC9ETTRQUjE4TUI0MjY5RjczQjc4NkU4M0VGNjhBNzBG
DQo+ID4+PiAzN0RGQjgyQERNNFBSMThNQjQyNjkubmFtcHJkMTgucHJvZC5vdXRsb29rLmNvbS9U
LyN0DQo+ID4+DQo+ID4+DQo+ID4+ICMzIHNlZW1zIG1vcmUgY29uc2VydmF0ZS4NCj4gPg0KPiA+
IEFyZSB5b3UgZ29vZCB3aXRoICMzPw0KPiANCj4gSSdtIHNvcnJ5IGZvciB0aGUgbGF0ZW5jeS4g
TGV0IG1lIGRvdWJsZSBjaGVjayB0byBhdm9pZCBwb3NzaWJsZQ0KPiBtaXN1bmRlcnN0YW5kaW5n
OyAjMyBtZWFuczoNCj4gDQo+IC0gMCB0byAyMywgYW5kIDUwIHRvIDEyNyBGZWF0dXJlIGJpdHMg
Zm9yIHRoZSBzcGVjaWZpYyBkZXZpY2UgdHlwZQ0KPiArIDAgdG8gMjMsIGFuZCA0NSB0byAxMjcg
RmVhdHVyZSBiaXRzIGZvciB0aGUgc3BlY2lmaWMgZGV2aWNlIHR5cGUNCj4gDQpObyBjaGFuZ2Ug
aW4gYWJvdmUgZmVhdHVyZSBiaXRzLg0KDQo+IHVzaW5nIGJpdHMgNDYtMzkgZm9yIFVEUCB0dW5u
ZWwgb2ZmbG9hZHMgYW5kIGxpa2VseSBiaXQgNDUgZm9yDQo+IFZJUlRJT19ORVRfRl9PVVRfTkVU
X0hFQURFUi4NCj4NClRoaXMgYWxzbyB0byB1c2UgYml0IDY5IGFzIHByb3Bvc2VkLg0KIA0KPiBU
aGUgVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMgbWFwcGluZyBzaG91bGQgYmUgc3Bl
Y2lmaWVkDQo+IGFmdGVyIGV2ZW50dWFsbHkgYSBuZXcgb2ZmbG9hZCBmZWF0dXJlIHdpbGwgYmUg
ZGVmaW5lZCB1c2luZyBhIGJpdCA+PSA2NC4NCj4NCk5vLiBVRFAgdHVubmVsIGZlYXR1cmUgYml0
cyA2NSB0byA2OCBtYXBzIHRvIGNvbW1hbmQgYml0cyA0Niw0Nyw0OCw0OS4NClRoaXMgaXMgdGhl
IG9ubHkgZGVzY3JpcHRpb24gY2hhbmdlIGluIFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxP
QURTIGNvbW1hbmQuDQpXb3VsZCBpdCB3b3JrPw0KDQpJbiBmYWN0LCB0aGlzIGNvbW1hbmQgZXh0
ZW5zaW9uIGFsb25lIHdvdWxkIGhhdmUgYmVlbiBzdWZmaWNpZW50IGlmIHRoZSB2bmV0X2hkciBo
YWQgYSBmaXhlZCBzaXplIHdoZXJlIG5ldyBmaWVsZHMgY291bGQgYmUgYWRkZWQuDQoNCj4gQW0g
SSBjb3JyZWN0Pw0KPiANCj4gVGhhbmtzLA0KPiANCj4gUGFvbG8NCg0K
