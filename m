Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137827E04C
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 07:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770190610; cv=fail; b=RBlcJY5n05GLcc9u/di4zbz10ISNMr5wr86SqEXylKV+D+d0M0j1ao72lM+ISpE5vYF26aNv5tXLBUd4cMuhmikACIzZUrHP/qHdNjiSlvtIcXSurNaeAYLkhsDYm6p/gz+CO8nI2J8KJiTe5Xwsv/eCNX1oALU3zvxSwsOr1WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770190610; c=relaxed/simple;
	bh=TC8ABIpicIEwcA6oi5e8Hs7/oBv3dMnAO5/ryQcXO1o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=grRhN37xHlpG9JivSFt6IeIYYAF05EFgRmeGwuTBhvUut3fe+Hq58GdwJeZt/IPeZ6kCHTWUjefNIrVTWMejyXUt909Igkz8efh0OUAiEVaPdW9drt4yAe7JZb+zbgp4m9xAi9Av/Rk3maQ7FWSTa98jo4dtD4QrX/0UqxCMK7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=TZlhwean; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="TZlhwean"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXFrve2Ofe96tTla0iawSamqF/Fljf8kJfDjb2T3Y7Lj05NnRqL6hJDHsT3fcZf6q5UHfzn30IDkd+Jwfwh7iGCrp+N3tb/PFWNPCWnSldOvzj/Yh5cEeqdfvtrPInIiQT/7pginEiC64YUzVgFBFSUvfKzoXZ/rdfSY1tnBUbtw0/quhKx647TnWfdQqphF2Zhi4OBVz+cnV6st+XOzeRu1qvVDqr+2FaoiVcGsdAD3Q8u3+owcl5EQ8b/slJPN4TWy4O3qjjdhbfWs53mFNyO231aEqyd40yeDlvLDhBu8zy1PvVbSosTjyUmTLjzGi15bs7Hz8bwUFu9zoUyx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC8ABIpicIEwcA6oi5e8Hs7/oBv3dMnAO5/ryQcXO1o=;
 b=oSUwUdZ+cYNqjlTFe4dpwAz/Q+SPqCu12aSeVWysJDUHWc+K3L30t1RDn1A/ZukqJcELJjsgvvYqj+7hOp05Tpq26wVdEbRUNRnUWvlYbuiygxo189p8HZnrrgiiCoaIdZgy/pAnhNAL9CqtosYi30UUZYTyCbhMnlyjUhF9nv/8TypSjQpfOSRFtQYY53lhEuiZ/WArD7D6MEPZYiqKP5ojqfWunuF42l0QISMWOAKfc8EkvUCTzOwTtr7Xny3TcTaD9ejk0vC3xTy0iNRkzlg3RXef+kFAWTMom+Eag7WIk9OwS+phTObKrIQo10eRO4mW8X8iW12N7pHtiwCejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC8ABIpicIEwcA6oi5e8Hs7/oBv3dMnAO5/ryQcXO1o=;
 b=TZlhweanj3xbU7bbQ5JrA1QfZNc76GKV+sM+7muNjouy8l0zmmWQ21ChK+wYqYPl79a8R+6wJ5gkAu6UbT8BDcZq+mi1XXKL1K2PgLXhBBY+i0vRHVSfNK1f7798AGVSWCsvUlcTdOQ0wh/kmMVmKHz5pD6rxyeJRVEw2Tq7WiohaQ0frM5hXxP5hByKuYlaxypmzGBPqQsjqUW3ouMByo6+YTW4F/F315/r/e68I+EGmocD1SmI3csxQzbxaj2MLifsCvLs4uN0oqsSujOj0EK8j3iPoTRiERXju2HSd5fvaFSvbKqHh/0mKGM3FpfXZ59DmvZROggRMIdvwtP2Zg==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PAWPR07MB9975.eurprd07.prod.outlook.com (2603:10a6:102:38c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:36:46 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9520.005; Wed, 4 Feb 2026
 07:36:46 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Jason Wang <jasowang@redhat.com>
CC: "parav@nvidia.com" <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "ingemar.s.johansson@ericsson.com"
	<ingemar.s.johansson@ericsson.com>, "mirja.kuehlewind@ericsson.com"
	<mirja.kuehlewind@ericsson.com>, "cheshire@apple.com" <cheshire@apple.com>,
	"rs.ietf@gmx.at" <rs.ietf@gmx.at>, "Jason_Livingood@comcast.com"
	<Jason_Livingood@comcast.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>
Subject: RE: [PATCH v11 1/2] virtio-net: Clarify ECN and GSO_ECN descriptions
Thread-Topic: [PATCH v11 1/2] virtio-net: Clarify ECN and GSO_ECN descriptions
Thread-Index: AQHclSkvOpx8EjLuCEOi7HfCelksjrVxyx0AgABOpbA=
Date: Wed, 4 Feb 2026 07:36:46 +0000
Message-ID:
 <PAXPR07MB7984CC834E71CF531B5D095CA398A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20260203162134.2765-1-chia-yu.chang@nokia-bell-labs.com>
 <20260203162134.2765-2-chia-yu.chang@nokia-bell-labs.com>
 <CACGkMEuN2=bK5X43Dd4mx3eV8zTujPH6amOVYXR1=atd6SDb3g@mail.gmail.com>
In-Reply-To:
 <CACGkMEuN2=bK5X43Dd4mx3eV8zTujPH6amOVYXR1=atd6SDb3g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PAWPR07MB9975:EE_
x-ms-office365-filtering-correlation-id: 603bac92-cdf5-4a30-091a-08de63c0269f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkFkRnlQK1VYTEtxN3BoYVhPWkRsRlBFaWxMMWRHTkl0UkhtRVhja1RtNFZh?=
 =?utf-8?B?VmlYdTh3S0Z3Rmk0dU05Z3RHR0I3YVgxM1ZWOHF6U0JoZmNNUit6TGpFR3k1?=
 =?utf-8?B?c0lDdEFvMjNDL1RwODlCNTJrSHREam5zYU5vSUlDbFh6L1pOTFVuVWliT1l5?=
 =?utf-8?B?NGU2VjZMUEtOOUt4MENDR3BpbnJPUmQzSjRPMmdPS1FKbkc1S0ttRHVyZzlO?=
 =?utf-8?B?NCtsbnJLaGx6aDEzRlZPdzdXNHBXbTVVK1pJTXVOU1IvRGJBS0pjZEkrT2U1?=
 =?utf-8?B?K3hMTGVIOXQrSDd0dDVZRGVIbkFOd3dXcUx3d2YyT0FrMUVGMVJwTWxNOEZI?=
 =?utf-8?B?V01BYUJjUHllOVkxN2ZvWnlqQ25nckhWRFlBb1hCRnh5RjRma2lOci9FYzlx?=
 =?utf-8?B?cEdxQVBnRGlWbXc2V0NPMUlCckVuTTlobXF3NEdUenRWMlRMU2E3VzBLMDEv?=
 =?utf-8?B?enBLbysrYnBLTFhvalc3WGRqWlhWOHd3R0xQbmJyRVN5SUVqa0w4YUtoSndB?=
 =?utf-8?B?cUo4ZFFZMmNsbXpNT3NFZWxMNDJhQitzL04xVk1ZcEFvYmtqdytSb2o4TDhu?=
 =?utf-8?B?NDcwRDJ4QVBJbCtWMnZPREFRNE0ybUw4VDZvYzB6TlllYk9tZFZ1UFRKbjhN?=
 =?utf-8?B?UXJ2QkFKNmdYMkd1a1pKczBvZFhNNEVUMFpjek9XL1VscGNFR0g2eUJIWU1a?=
 =?utf-8?B?VGVVUDlkdnRwYnBaa3U2Z0pQd2JHWHZJRmRnVS80ZXhVbXJHbkxKaGVqTUts?=
 =?utf-8?B?RzNiSysyNXB3N2FVc2l3bmh2YUkyeUpaZDY2TVhqRW9xMVM2TFZlNWVhQXpz?=
 =?utf-8?B?YzRGMitZTWQ2VzEzT29nNytxaDg1TGFRM0ZSWm9DWWxuSUJXNEJGYS9sUTJk?=
 =?utf-8?B?dk40cXIrS2p1ZTBXNTAybEtyVG5NOUd1d1IvRThha29CUVVBL3pQWnBsdWlu?=
 =?utf-8?B?MGxrOUFUeWxOWWM5d3JuVkpCR1JoMGdtTTVTM0NZRkJjeEpXTW1FTjZualNr?=
 =?utf-8?B?WkdPQzFtNkxMRVhCUWFmajlsTkFQbHVtbXhxSGN2VTA2cjk4VUN1RVRtUFcv?=
 =?utf-8?B?N1QzRDRmTzJ3QjV2UGdrRXlSNFRKRTZBMEUyS1lsanFRL3pneVRHRUE1OURp?=
 =?utf-8?B?SS9RS3V3b2hoQm9JYVRrS1NIZXlub3Fyd0w5THVUcHRKT1VxVXUwcFRpczlS?=
 =?utf-8?B?ZkZQdjlDT1hKMjBRUjRtY0k1dFdiM2d6NnRUZEM1NzQvc3B2NXcxK1NkbGhu?=
 =?utf-8?B?YXdUbk56UlBlUlRLTnFKa1QzZERIYXo3Q01jU2ZyNjdRZzNDNlIxbFFVNyt6?=
 =?utf-8?B?N2JYSWpKOFFpbE00UU5vRXFJZDJ2M0Mya1RFT0lFWTFNSFp6Uy92dVh2U1Rh?=
 =?utf-8?B?NStrQ245RHJHWG9sT1htUjRUdTFYWjVkeWFvdnpUZzIxNzBBVlFwUVQ0QzVy?=
 =?utf-8?B?c0hLdnpMcXU0L1lXL2xkR0xxZ2xYVUlPQktSd1FlSVdveTRXTVdTSm5RaHZO?=
 =?utf-8?B?RUdHU3NpT2lwNzlrTWpLc3VqN1Nka2ExRUNzVWdoSHQwS1Fzem4zUWhPSjVO?=
 =?utf-8?B?QmdMV1ROa2dCdVFtTHlEQ043ZEtueHYva291b2tVSkY2RjlaNUd3a3YrcitK?=
 =?utf-8?B?R0J4dC9VYXErQ21qdGlhMFkydTlubnBnVGNqVEdZeDBGYnRmWWxjTDhlRkRM?=
 =?utf-8?B?MFk1RWJkSjVtMmErQllzSmliTXRWdjdpcmJnSGN2S2lGN2k5WUdRdk9EaURE?=
 =?utf-8?B?TkZPYTVkZ2IxR3ovMEFQOFN4aWNENk12amlCb1ROOUQyaDZlRXhxamVhMENO?=
 =?utf-8?B?SHd1eFZaemhOTGJ6UlNyeXpldDh3VHZHa3J6WE5VcDlrMHBlZ01wZmtjRjgv?=
 =?utf-8?B?emRzN1FTdzdXMmhib2RrWkRBT3BYY0tjZ0o3c1dZVjBCRFZVb3hIb002cnZB?=
 =?utf-8?B?SFlmaHl6c04yM21JUVFIdWgvbnZSTEFjVE5DVjhKSlFMbTJZbnRtT0IwQmo5?=
 =?utf-8?B?MDZHMGdpdHJvUWlIcjVPLzJPYUdCTDdRc2laN0dCaEJmTndYcEp6azYxT3Bs?=
 =?utf-8?B?NjhMSStyV1JRT0h1OUVPcDlmbzhPdTNQdk9MQUNmSXU5UHNMT251TVE3RGI0?=
 =?utf-8?B?MUd1cWwrSmxIa2ZyZ1hSeXVBUlE3RFk3R2F4QmlhSUVYby8xVkJMTFFqdVVM?=
 =?utf-8?Q?iOiVTgYzhmptCvTeuznh9KQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHJReEo3SnlqWmxJODM4T1o1QkZITVE3ODl1emxRK21KVit4OHVoM3ZNOTFa?=
 =?utf-8?B?TkREMDN5cEpWT1VySUZVZFR0ZlQwNHN6MHVWMVJlN21KR0VIbWxDREd3Qk9Z?=
 =?utf-8?B?YlExdWM1TmNjVUxXdXFZOWZjb0wrSXQwbEFnMEgydDBFVUltQVpIMFZTTkNW?=
 =?utf-8?B?elZvbU5uL212NUl2WU4yVStZRU9pc3Y4cnNjQmduWVBtZU4zMmxYb2FkOWFz?=
 =?utf-8?B?VGYzSXY1NXFNS2YxL2sxaDNlZEpQZ1gzUnhjaERRSnA5aGNNc1RGYkVHODhv?=
 =?utf-8?B?M3ZIeFExajJKMDhQdzRtYzR5T1VOd0xxYnprNDAxMkJFYkhTOFh6RXZVUGgy?=
 =?utf-8?B?SEdJMGU4TW1Zb2dqMWMzNWNhd29jbndYTHN0SHBkRXFIM1Bqc2pad2JPV1V5?=
 =?utf-8?B?aDRGclRBVGtsUCsveTYrUklhUWtRUE9qbHZnZTJORlZqeFAxdThXc3R6VWdC?=
 =?utf-8?B?WDBBUnEyTE04USs3bTRFY0FtQ2NualVRVjNueDVMWG12OHRYVlJZWFk0eW9W?=
 =?utf-8?B?dEpEd3M5eTRiS1o3NURKSG1lMHlONmM5YlFwRGYvMHJMWU1lclRLYlliL2tE?=
 =?utf-8?B?d09CWnl6ZmlTVndzTGlIK21TTCtNUnBmTjRnYU5vLzZWYXRVekU0aEE0ZmdZ?=
 =?utf-8?B?M2RNVnVOdHYyaW1qUTNRbVRwQjhoVlhQRG40djJSNkl1MzdBZGM1eG44R0pr?=
 =?utf-8?B?ZHp6ZE8xYnA0d2lxR1dVcldES0RPUWFITVFDRGsrT2VYOVZtVUM1OXRWRmxB?=
 =?utf-8?B?WGJselNzS2pkVWRTVjZML0NWOE5NODVKRHdzamVCbVIzS3hYTHZ6SEJrOUhI?=
 =?utf-8?B?WFlwWTF4Q29aVEVzSjVwSmFYbjhtakNKdjR4ZVJReWJRUTV3b1EvQ3oxMm50?=
 =?utf-8?B?a0R2SUdJeG1ZY3FoUlBobUpML3BUZGZZcVhnWU9NQ3BlRGpBWS84cktVVmZY?=
 =?utf-8?B?cjBieUwxQzJxN0plVUdYTlVhMjNrVGVBREg0c1d3S2orSGxySCtmUGVNNVlZ?=
 =?utf-8?B?Q2pzblFBV0RtdVgrVUVzWTJsbkxjRm8rcTRJSU1DODRXK203Um90TDRWclRi?=
 =?utf-8?B?b2p1Zmx4S1FqRDdEOFJmZzh3eExaY2M3T2U2TlRyWm5kekI0NU9vM0JLbmpN?=
 =?utf-8?B?RkJkZ3c4NlNVSnJRcmUzcENvOHhYbWM1bUZrbHNQNlVKZFlwSnhuVjc3d3JQ?=
 =?utf-8?B?d2dNQ1REVS9QN2RETGk4L3RYNjZFSjZmYVoxWHk5aGV3eGxQYVREcFVySG9a?=
 =?utf-8?B?bTU3QlpCWWVQYXJQMXd4MXlVd01XUzNvVEsvbXBOSXdSeFh2ZlhUeEEwNE5O?=
 =?utf-8?B?aWlCeVRHOUxBVWJGaUIwV05ldDY4bXdLaU1QNC9GYnh3RUxYYzZQYU5Ga29G?=
 =?utf-8?B?dmxpdE9tZXc3RzVkeUFodlR4SWVsN0trT0hPQ2k0N0pjZTdnTlB0SGl1dk90?=
 =?utf-8?B?dGpQUXVvSG02L3J5Vitxb2t2Nmx3MFNYVWNwNDYrUFIvbnlib0hqSEZWQTVv?=
 =?utf-8?B?TEUwcTkxRTFjdlNHUVN2WENLQU42VlZPS2ViRkFBazFOZ09UOEloc01DUUVW?=
 =?utf-8?B?dktLMkZNK1pSODVHTTBYN1RXVDdHSWdRazJybG8ra3VGVVNJYXcxUk5SSjZr?=
 =?utf-8?B?MEU1QWl0NDRRZUVRV1N4dmxSdTBMUHM2UlRHT2pUdjBGbU5vSGlISWtUWkw4?=
 =?utf-8?B?cU0xWmx4L3NMaUtNcGsxQ09rU2V6OVpsakRIK25oeUVJdExQK3c5dmNxbGd0?=
 =?utf-8?B?RDNraUdqbUtXSWpLRkk0WHladkFubG5qU000eEhQRDN2SFI3dWo4Z09zMjQy?=
 =?utf-8?B?bUFWY096MkhmZnRoM1B1dkR4UG9rSnBUcGR0QldmSEVKdzR6ZUh4ZVE2Nmwv?=
 =?utf-8?B?OUQrSWFsQUZaOWZZeDVWRzVsNjBmL1RTYzdzQW1tMnNkV0pjS2pqdTJNVlk2?=
 =?utf-8?B?UHdYTW5FOFFWa3p0cU8vRGo5c0txVnR0Qlk0ZTROUE1yaWdXT3hneGwwZlFl?=
 =?utf-8?B?dUFKVW93d0dZNmR0WHppRmJ0eUZCNTVIeU40aTRUelNDWFNaeEREWUxhVXY0?=
 =?utf-8?B?Q1A1OGU5dDYvRi9Ga1ZGYkV5YmFLeHN0d0FHUjk1WjBsaVl5RXJuNXBRTnZD?=
 =?utf-8?B?TGdGMUFFUG5PL1gwRnBVMW9sT3gzUllUcE1xd1h4Ry9oeTJWWkMySVZFb09C?=
 =?utf-8?B?WEFKa3dzdWV3Q1p0aEVSbHVzekVrVWQ0eU1JSktiSzg2TjZIMDlpbjNXeFA4?=
 =?utf-8?B?WVdWczhoZXhpRS9pOHI2KzluTTRJMEJUZjdTenFhbTZ4Q3VPeGh4YlBuM0dO?=
 =?utf-8?B?VzUvekptR1JNN3pMdkxoZXpNNjAyam9uQzRPdGxWOSt6QW5pZVFiWUsyenNW?=
 =?utf-8?Q?QAU2z7KQKRL0zZDA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603bac92-cdf5-4a30-091a-08de63c0269f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 07:36:46.5595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BfS7LeivmMiE2jyRcCAZ1EM3q7we4WqlRbhsMbbqIL8QAJGvbGsqEvlQU4gLAxvrRgP2v5JsUyBOoTqidgQSRXKLgIUUIWw/9GBSKMGGjvinhVixWBmyDMi5VppEK1vS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9975

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPiANCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSA0LCAyMDI2IDM6MDUg
QU0NCj4gVG86IENoaWEtWXUgQ2hhbmcgKE5va2lhKSA8Y2hpYS15dS5jaGFuZ0Bub2tpYS1iZWxs
LWxhYnMuY29tPg0KPiBDYzogcGFyYXZAbnZpZGlhLmNvbTsgdmlydGlvLWNvbW1lbnRAbGlzdHMu
bGludXguZGV2OyBtc3RAcmVkaGF0LmNvbTsgY29odWNrQHJlZGhhdC5jb207IG12YXJhbGFyQHJl
ZGhhdC5jb207IHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tOyBlcGVyZXptYUByZWRoYXQuY29t
OyBpakBrZXJuZWwub3JnOyBuY2FyZHdlbGxAZ29vZ2xlLmNvbTsgS29lbiBEZSBTY2hlcHBlciAo
Tm9raWEpIDxrb2VuLmRlX3NjaGVwcGVyQG5va2lhLWJlbGwtbGFicy5jb20+OyBnLndoaXRlQGNh
YmxlbGFicy5jb207IGluZ2VtYXIucy5qb2hhbnNzb25AZXJpY3Nzb24uY29tOyBtaXJqYS5rdWVo
bGV3aW5kQGVyaWNzc29uLmNvbTsgY2hlc2hpcmVAYXBwbGUuY29tOyBycy5pZXRmQGdteC5hdDsg
SmFzb25fTGl2aW5nb29kQGNvbWNhc3QuY29tOyB2aWRoaV9nb2VsQGFwcGxlLmNvbQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYxMSAxLzJdIHZpcnRpby1uZXQ6IENsYXJpZnkgRUNOIGFuZCBHU09f
RUNOIGRlc2NyaXB0aW9ucw0KPiANCj4gDQo+IENBVVRJT046IFRoaXMgaXMgYW4gZXh0ZXJuYWwg
ZW1haWwuIFBsZWFzZSBiZSB2ZXJ5IGNhcmVmdWwgd2hlbiBjbGlja2luZyBsaW5rcyBvciBvcGVu
aW5nIGF0dGFjaG1lbnRzLiBTZWUgdGhlIFVSTCBub2suaXQvZXh0IGZvciBhZGRpdGlvbmFsIGlu
Zm9ybWF0aW9uLg0KPiANCj4gDQo+IA0KPiBPbiBXZWQsIEZlYiA0LCAyMDI2IGF0IDEyOjIx4oCv
QU0gPGNoaWEteXUuY2hhbmdAbm9raWEtYmVsbC1sYWJzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBG
cm9tOiBDaGlhLVl1IENoYW5nIDxjaGlhLXl1LmNoYW5nQG5va2lhLWJlbGwtbGFicy5jb20+DQo+
ID4NCj4gPiBUaGUgZXhpc3Rpbmcgc3BlY2lmaWNhdGlvbiB0aGF0IGRlc2NyaWJpbmcgVklSVElP
X05FVF9GXypfRUNOIGFuZCANCj4gPiBWSVJUSU9fTkVUX0hEUl9HU09fRUNOIGNhbiBiZSBtaXNp
bnRlcnByZXRlZCBhcyByZWZmZXJpbmcgdG8gdGhlIElQIA0KPiA+IEVDTiBmaWVsZC4gSW4gcmVh
bGl0eSwgVklSVElPX05FVF9IRFJfR1NPX0VDTiBjb3JyZXNwb25kcyB0byB0aGUgVENQIA0KPiA+
IENXUiBmbGFnIGFuZCBpbmRpY2F0ZXMgdGhhdCBzZWdtZW50IG9mZmxvYWQgbXVzdCBmb2xsb3cg
dGhlIHJ1bGVzIA0KPiA+IGRlZmluZWQgaW4NCj4gPiBSRkMzMTY4IFNlY3Rpb24gNi4xLjI6IHRo
ZSBmaXJzdCBlbWl0dGVkIHNlZ21lbnQgcmV0YWlucyB0aGUgQ1dSIGZsYWcsIA0KPiA+IGFuZCBh
bGwgc3Vic2VxdWVudCBzZWdtZW50cyBtdXN0IGNsZWFyIGl0Lg0KPiA+DQo+ID4gVGhpcyBwYXRj
aCB1cGRhdGVzIEVDTiBmZWF0dXJlIGRlc2NyaXB0aW9ucyBhbmQgdGhlIHRyYW5zbWl0L3JlY2Vp
dmUgDQo+ID4gcmVxdWlyZW1lbnRzIHRvIGFjY3VyYXRlbHkgcmVmbGVjdCB0aGUgaW50ZW5kZWQg
YmVoYXZpb3IgZXhwbGljaXRseSANCj4gPiBzcGVjaWZpZWQgaW4gUkZDMzE2OC4NCj4gPg0KPiA+
IEZvciBkZXRhaWxlZCByZXF1aXJlbWVudHMsIHNlZSBSRkMzMTY4Og0KPiA+IGh0dHBzOi8vZGF0
YXRyYWNrZXIuaWV0Zi5vcmcvZG9jL2h0bWwvcmZjMzE2OA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hpYS1ZdSBDaGFuZyA8Y2hpYS15dS5jaGFuZ0Bub2tpYS1iZWxsLWxhYnMuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCB8IDM1ICsrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ID4gIGludHJvZHVjdGlvbi50ZXggICAgICAgICAg
ICAgICAgIHwgIDMgKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MTYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZGV2aWNlLXR5cGVzL25ldC9k
ZXNjcmlwdGlvbi50ZXggDQo+ID4gYi9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0K
PiA+IGluZGV4IGRhOWZmMTcuLjBkYThmOWYgMTAwNjQ0DQo+ID4gLS0tIGEvZGV2aWNlLXR5cGVz
L25ldC9kZXNjcmlwdGlvbi50ZXgNCj4gPiArKysgYi9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0
aW9uLnRleA0KPiA+IEBAIC01NCw3ICs1NCw5IEBAIFxzdWJzZWN0aW9ue0ZlYXR1cmUgYml0c31c
bGFiZWx7c2VjOkRldmljZSBUeXBlcyAvIA0KPiA+IE5ldHdvcmsgRGV2aWNlIC8gRmVhdHVyZSBi
aXRzDQo+ID4NCj4gPiAgXGl0ZW1bVklSVElPX05FVF9GX0dVRVNUX1RTTzYgKDgpXSBEcml2ZXIg
Y2FuIHJlY2VpdmUgVFNPdjYuDQo+ID4NCj4gPiAtXGl0ZW1bVklSVElPX05FVF9GX0dVRVNUX0VD
TiAoOSldIERyaXZlciBjYW4gcmVjZWl2ZSBUU08gd2l0aCBFQ04uDQo+ID4gK1xpdGVtW1ZJUlRJ
T19ORVRfRl9HVUVTVF9FQ04gKDkpXSBEcml2ZXIgY2FuIHJlY2VpdmUgVFNPIHdpdGggdGhlIENX
UiBmbGFnIHNldA0KPiA+ICsgICAgYW5kIGZvbGxvdyB0aGUgcmVxdWlyZW1lbnRzIG9mIHRoZSBD
V1IgYml0IGRlc2NyaWJlZCBpbg0KPiA+ICsgICAgYGBTZWN0aW9uIDYuMS4yLiBUaGUgVENQIFNl
bmRlcicnIG9mIFxoeXBlcnJlZltpbnRybzpyZmMzMTY4XXtbUkZDMzE2OF19Lg0KPiA+DQo+ID4g
IFxpdGVtW1ZJUlRJT19ORVRfRl9HVUVTVF9VRk8gKDEwKV0gRHJpdmVyIGNhbiByZWNlaXZlIFVG
Ty4NCj4gPg0KPiA+IEBAIC02Miw3ICs2NCw5IEBAIFxzdWJzZWN0aW9ue0ZlYXR1cmUgYml0c31c
bGFiZWx7c2VjOkRldmljZSBUeXBlcyAvIA0KPiA+IE5ldHdvcmsgRGV2aWNlIC8gRmVhdHVyZSBi
aXRzDQo+ID4NCj4gPiAgXGl0ZW1bVklSVElPX05FVF9GX0hPU1RfVFNPNiAoMTIpXSBEZXZpY2Ug
Y2FuIHJlY2VpdmUgVFNPdjYuDQo+ID4NCj4gPiAtXGl0ZW1bVklSVElPX05FVF9GX0hPU1RfRUNO
ICgxMyldIERldmljZSBjYW4gcmVjZWl2ZSBUU08gd2l0aCBFQ04uDQo+ID4gK1xpdGVtW1ZJUlRJ
T19ORVRfRl9IT1NUX0VDTiAoMTMpXSBEZXZpY2UgY2FuIHJlY2VpdmUgVFNPIHdpdGggdGhlIENX
UiBmbGFnIHNldA0KPiA+ICsgICAgYW5kIGZvbGxvdyB0aGUgcmVxdWlyZW1lbnRzIG9mIHRoZSBD
V1IgYml0IGRlc2NyaWJlZCBpbg0KPiA+ICsgICAgYGBTZWN0aW9uIDYuMS4yLiBUaGUgVENQIFNl
bmRlcicnIG9mIFxoeXBlcnJlZltpbnRybzpyZmMzMTY4XXtbUkZDMzE2OF19Lg0KPiA+DQo+ID4g
IFxpdGVtW1ZJUlRJT19ORVRfRl9IT1NUX1VGTyAoMTQpXSBEZXZpY2UgY2FuIHJlY2VpdmUgVUZP
Lg0KPiA+DQo+ID4gQEAgLTcyOSw5ICs3MzMsMTAgQEAgXHN1YnN1YnNlY3Rpb257UGFja2V0IFRy
YW5zbWlzc2lvbn1cbGFiZWx7c2VjOkRldmljZSBUeXBlcyAvIE5ldHdvcmsgRGV2aWNlIC8gRGUN
Cj4gPiAgICAgIGhlYWRlciAoaWUuIE1TUykuDQo+ID4NCj4gPiAgICBcaXRlbSBJZiB0aGUgZHJp
dmVyIG5lZ290aWF0ZWQgdGhlIFZJUlRJT19ORVRfRl9IT1NUX0VDTiBmZWF0dXJlLA0KPiA+IC0g
ICAgdGhlIFZJUlRJT19ORVRfSERSX0dTT19FQ04gYml0IGluIFxmaWVsZHtnc29fdHlwZX0NCj4g
PiAtICAgIGluZGljYXRlcyB0aGF0IHRoZSBUQ1AgcGFja2V0IGhhcyB0aGUgRUNOIGJpdCBzZXRc
Zm9vdG5vdGV7VGhpcyBjYXNlIGlzIG5vdCBoYW5kbGVkIGJ5IHNvbWUgb2xkZXIgaGFyZHdhcmUs
IHNvIGlzIGNhbGxlZCBvdXQNCj4gPiAtc3BlY2lmaWNhbGx5IGluIHRoZSBwcm90b2NvbC59Lg0K
PiA+ICsgICAgdGhlIFZJUlRJT19ORVRfSERSX0dTT19FQ04gYml0IGluIFxmaWVsZHtnc29fdHlw
ZX0gaW5kaWNhdGVzIHRoYXQgdGhlIFRDUCBwYWNrZXQNCj4gPiArICAgIGhhcyB0aGUgQ1dSIGZs
YWcgc2V0IGFuZCBmb2xsb3dzIHRoZSByZXF1aXJlbWVudHMgb2YgdGhlIENXUiBmbGFnIGRlc2Ny
aWJlZCBpbg0KPiA+ICsgICAgYGBTZWN0aW9uIDYuMS4yLiBUaGUgVENQIFNlbmRlcicnIG9mIFxo
eXBlcnJlZltpbnRybzpyZmMzMTY4XXtbUkZDMzE2OF19Lg0KPiA+ICsgICAgXGZvb3Rub3Rle1Ro
aXMgY2FzZSBpcyBub3QgaGFuZGxlZCBieSBzb21lIG9sZGVyIGhhcmR3YXJlLCBzbyBpcyBjYWxs
ZWQgb3V0IHNwZWNpZmljYWxseSBpbiB0aGUgcHJvdG9jb2wufS4NCj4gPiAgICAgXGVuZHtpdGVt
aXplfQ0KPiA+DQo+ID4gIFxpdGVtIElmIHRoZSBkcml2ZXIgbmVnb3RpYXRlZCB0aGUgVklSVElP
X05FVF9GX0hPU1RfVURQX1RVTk5FTF9HU08gDQo+ID4gZmVhdHVyZSBhbmQgdGhlIEBAIC04Mjgs
MTAgKzgzMyw5IEBAIFxzdWJzdWJzZWN0aW9ue1BhY2tldCANCj4gPiBUcmFuc21pc3Npb259XGxh
YmVse3NlYzpEZXZpY2UgVHlwZXMgLyBOZXR3b3JrIERldmljZSAvIERlICBcZmllbGR7Z3NvX3R5
cGV9IHRvIFZJUlRJT19ORVRfSERSX0dTT19VRFBfTDQuDQo+ID4NCj4gPiAgVGhlIGRyaXZlciBT
SE9VTEQgTk9UIHNlbmQgdG8gdGhlIGRldmljZSBUQ1AgcGFja2V0cyByZXF1aXJpbmcgc2VnbWVu
dGF0aW9uIG9mZmxvYWQNCj4gPiAtd2hpY2ggaGF2ZSB0aGUgRXhwbGljaXQgQ29uZ2VzdGlvbiBO
b3RpZmljYXRpb24gYml0IHNldCwgdW5sZXNzIHRoZQ0KPiA+IC1WSVJUSU9fTkVUX0ZfSE9TVF9F
Q04gZmVhdHVyZSBpcyBuZWdvdGlhdGVkLCBpbiB3aGljaCBjYXNlIHRoZQ0KPiA+IC1kcml2ZXIg
TVVTVCBzZXQgdGhlIFZJUlRJT19ORVRfSERSX0dTT19FQ04gYml0IGluDQo+ID4gLVxmaWVsZHtn
c29fdHlwZX0uDQo+ID4gK3doaWNoIG5lZWQgdG8gZm9sbG93IHRoZSBDV1IgZmxhZyByZXF1aXJl
bWVudHMgZGVzY3JpYmVkIGluIGBgU2VjdGlvbiA2LjEuMi4gVGhlIFRDUCBTZW5kZXInJw0KPiA+
ICtvZiBcaHlwZXJyZWZbaW50cm86cmZjMzE2OF17W1JGQzMxNjhdfSwgdW5sZXNzIHRoZSANCj4g
PiArVklSVElPX05FVF9GX0hPU1RfRUNOIGZlYXR1cmUgaXMgbmVnb3RpYXRlZCwgaW4gd2hpY2gg
Y2FzZSB0aGUgZHJpdmVyIE1VU1Qgc2V0IHRoZSBWSVJUSU9fTkVUX0hEUl9HU09fRUNOIGJpdCBp
biBcZmllbGR7Z3NvX3R5cGV9Lg0KPiANCj4gSSB3b25kZXIgaWYgaXQncyBiZXR0ZXIgdG8gaGF2
ZSBzb21lIGNvbXBhdGliaWxpdHkgZGVzY3JpcHRpb24gaGVyZSBpbnN0ZWFkIG9mIHJlbW92aW5n
IHRoZSBvbGQgRUNOIGNvbXBsZXRlbHkuDQo+IFsuLi5dDQoNCkhpIEphc29uLA0KDQpJIHdhcyBz
dGlsbCB0aGlua2luZyB0byByZW1vdmUgb2xkIEVDTiBkZXNjcmlwdGlvbnMsIGJlY2F1c2UgaXQg
aXMgbm90IGNvcnJlY3QuDQpBcyB0aGUgR1NPIGZsYWdzIGhlcmUgd2FzIHRvIHByb3Blcmx5IGhh
bmRsZSBUQ1AgQ1dSIGZsYWcsIG5vdCBFQ04gYml0IGluIElQLg0KDQpCdXQsIG1heWJlIGFkZGlu
ZyBhbm90aGVyIHBhcmFncmFwaCBiZWxvdyAocGxzIHNlZSBiZWxvdyBwcm9wb3NhbCkgY2FuIGZ1
bGZpbGwgeW91ciByZXF1ZXN0Pw0KDQoiRWFybGllciB2ZXJzaW9ucyBvZiB0aGlzIHNwZWNpZmlj
YXRpb24sIGFuZCBzb21lIGV4aXN0aW5nIGltcGxlbWVudGF0aW9ucywNCmRlc2NyaWJlZCBHU09f
RUNOIGluIHRlcm1zIG9mIHRoZSBJUCBFQ04gZmllbGQgcmF0aGVyIHRoYW4gdGhlIFRDUCBDV1Ig
ZmxhZy4NCkRldmljZXMgTUFZIGNvbnRpbnVlIHRvIGFjY2VwdCBwYWNrZXRzIHdoZXJlIHRoZSBD
V1IgZmxhZyBpcyBub3Qgc2V0IGJ1dCB0aGUNClx0ZXh0dHR7VklSVElPX05FVF9IRFJfR1NPX0VD
Tn0gYml0IGlzIHByZXNlbnQsIHRyZWF0aW5nIHN1Y2ggcGFja2V0cyBhcyBpZg0KRUNOIG9mZmxv
YWQgd2VyZSBub3QgcmVxdWVzdGVkLiBEcml2ZXJzLCBob3dldmVyLCBNVVNUIHVzZQ0KXHRleHR0
dHtWSVJUSU9fTkVUX0hEUl9HU09fRUNOfSBvbmx5IHRvIGluZGljYXRlIHRoZSBwcmVzZW5jZSBv
ZiB0aGUNClRDUCBDV1IgZmxhZyBhbmQgTVVTVCBOT1Qgc2V0IGl0IHNvbGVseSBkdWUgdG8gdGhl
IElQIEVDTiBmaWVsZC4iDQoNCg0KQW5kIGlmIHdlIGhhdmUgdG8gaW1wbGVtZW50IHRoaXMgTUFZ
IGZlYXR1cmUgaW4gdmlydGlvX25ldC5oIG9mIExpbnV4LCB3ZSB0aGVuIG5lZWQgdG8gZmV0Y2gg
VENQIGhlYWRlciAoT3IgYW55IG90aGVyIHN1Z2dlc3RlZCB3YXk/KS4NCg0KVGhhbmtzIQ0KQ2hp
YS1ZdQ0K
