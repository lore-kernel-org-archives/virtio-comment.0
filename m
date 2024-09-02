Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3821219E982
	for <virtio-comment@lists.linux.dev>; Mon,  2 Sep 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280317; cv=fail; b=d3zELDjl9Ny/qdY921tTvYJpkFtE8TGY5GBpbM9iw5Kzq2vZO3w826n48OmiWdJahNVSryOBFBjuxlrtdmFvcKjoVkC8rp3k96zJkFoEBbBtDxhUg6swNybvWb6+9CpTC1IFrS3ffyoWeObJ9NDqESc6sxlfk/ZhkyTPvxZBpv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280317; c=relaxed/simple;
	bh=/1CDcnmwt0ugwcbWz1nybd+3xGYLzAoyrN5fF2j5TW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=hGS6sulb9lu9widYJeLEUyi8ZZvaryylDQlG/JBXIlpFXidb4gIVXBsbIsodGPTPpGhUTjgUVwHgNaAoDL8NQBr1JfqA9IeKQLPMPThUdzHuGGnqVUtNYXQAfpqLrN0NNIvCTFc2LQnOAm84+TLusNUG4Zd3jGhPn3WYuKl56gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Z0SFSIej reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Z0SFSIej"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482BFps7030219;
	Mon, 2 Sep 2024 05:31:47 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 41dcatr6a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 05:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdVLHi751ts3QmcdOZjvrfomjLqqXHipzutz6/rcz6+3TPLBlulVIdFvnZ1jklzMCfGjUTE0DEmQ9EwcdODCEN+518AaYNK+JMWrrNuifF3RasodMpHStTa+RX9U0qrhroMvSifmsukdJaicw+vNxQ2X+6BVuPMYfcoMqE9BFh/KQ2KRX36WEkXbLDOtmkXKhPyL2c5mJScwvRXU36CMWG0w4sDFrhdIEP6Mknk/g/OoAfujIDGvMl2VFzAoE3VqFkAkRutDpEjhVMDQP3Svjv5sJKh01deQLz6gUW1pRyXo8YkanIX/zZEh9pnYWJTqVkR3nocUSFfg26agnhufFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtPg1AavsatUaiHMUAvYKUADQM2OMK4s5nrPVDh3EHI=;
 b=qW1D6lNVHSiqj7nET3wUHT7yOoDUdmeCChjacJFMEI3bslfNuy5PchMVKnXLlQXhRP7b8EWuewLr2WjVaR7Ui8Qe308qBO4ACRPGih6t9SU0UN82FayKasjWkRz1ZSllrGnuOfmGTqR6AaCemo86Rah6zve5z7yefvGq11zprAJO8/CorPh3vIC6qIqiAT+CZvmHFQ/7S+S3cWpMU59D9FM8FZ4UHQ/R+u+82eG2DlDoD0sd6F+rs848Ni/P/WNq82tNHE9Km4Lc588fyv5/eHz67+LKFICJGjadxygzttn3p/+RfNIxBImVGtporsgOw9EWfGTfFeJB1wQLVFGAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtPg1AavsatUaiHMUAvYKUADQM2OMK4s5nrPVDh3EHI=;
 b=Z0SFSIej+nJ3cYKGN8S6tIY8S5VT4iFRVFNJS2q2rIuLm+ToQBB6cjiK6kHbEzfNnTudIjaJi6CH4URSpYy2F3NweMwkn0ZUz/aZy8EByemevuHsBlYWPMfHdJlwyAiyrUFBJfkxhbdVK4z9k/WBV1FagTPJoqvwnWngy8TqHGQ=
Received: from DM4PR18MB4269.namprd18.prod.outlook.com (2603:10b6:5:394::18)
 by SJ0PR18MB4851.namprd18.prod.outlook.com (2603:10b6:a03:403::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 12:31:43 +0000
Received: from DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a]) by DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a%7]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 12:31:43 +0000
From: Shiva Shankar Kommula <kshankar@marvell.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
        Eelco Chaudron
	<echaudro@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Stefano Garzarella
	<sgarzare@redhat.com>,
        Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Willem de Bruijn <willemb@google.com>
Subject: RE: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
 segmentation offload feature
Thread-Topic: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
 segmentation offload feature
Thread-Index: AQHa9ABgCEM9JfxrOEqgBI1WHDoU+bIzUlgAgAYl1DCABPXpAIAGDReA
Date: Mon, 2 Sep 2024 12:31:43 +0000
Message-ID:
 <DM4PR18MB4269B8AE69F8B56F0188D598DF922@DM4PR18MB4269.namprd18.prod.outlook.com>
References: <cover.1724234131.git.pabeni@redhat.com>
 <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
 <70256c1c-f5dd-4ccd-a414-434bb56612fd@redhat.com>
 <DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com>
 <5b555612-dcac-46d9-acb2-f712a40a4ede@redhat.com>
In-Reply-To: <5b555612-dcac-46d9-acb2-f712a40a4ede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4269:EE_|SJ0PR18MB4851:EE_
x-ms-office365-filtering-correlation-id: 1d88685c-4887-476e-64d1-08dccb4b33ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a29Rc0RhNFZ5elhzcXkxN1FlZm9qcWd0Um9nZXhBK0ZUWE94ZzliWmV4MlBS?=
 =?utf-8?B?d2F4eTNUREdCTExRNDdGL1J6cVRMOUF2RTF1VXBuOE1EajJkYlNuZjZOQURG?=
 =?utf-8?B?YlBrMVBNZjE3MnlYQkFXSGlGcHFvTFZUMGtSRGJ6ZjA0aVArQkx0QTJzTlNL?=
 =?utf-8?B?MzFjYkFuNUpGZnFweW9reUFQbS9oeStLUW5ESU1LSTJPYzhaenhHd1J0VDVk?=
 =?utf-8?B?N1JBTmlHaVJCUnBpZXI1TXVxM0gvK0tnZHdoVGp6YTBLRTFIWmZ0L1Z4emJL?=
 =?utf-8?B?MFMvajhtZjlob0ZmVkwrenNuMi9pQUFSUVhCR3JybzNPUWFoMHlWMGhDQ0JG?=
 =?utf-8?B?alpPSjkzcEkveDJrVTU1OEVnMXlIZkFLNUorMlFuN0FvcitzSFJ3U2lKcXcz?=
 =?utf-8?B?K2xyNUVsT1VwT2xkS1FFWmxTS2d5ZXZaMFJBUjJ4UHM5b2dzby8vNVYrU2oy?=
 =?utf-8?B?Qi9wdkJjK0N1SzcwOUVqQnBrdkVkT2lJOFluOXBzbHpESm5rSE56cUJ4aEVJ?=
 =?utf-8?B?QW1HQktOVmNmYVRDUmF5YmhOTWZTelZBSFhLckdXMWhxVWlEUERPT0UyTDdJ?=
 =?utf-8?B?L2R4dW1JKzlqdC9LaUJQNFUzTFc4MFc2SUJRbnVGWDNxNDJ0WHd1TDRtTE5m?=
 =?utf-8?B?czZ3dUpGYXo4TnA2OEl6b2tDbWRqNVpSQldFK1MwY0UwMTFoTFZyTE5jeTVv?=
 =?utf-8?B?cnQvNVYrZ25zeVp5WU80ZFluc285RFEwVkpFd051NUVVTnRCSUs3VHFqZHI4?=
 =?utf-8?B?d0pmY0VTcWNMaVdsRFA0WnIwVWJIanJkOHo0RmgzWFozdGlJMWZOVnpXWDN5?=
 =?utf-8?B?aUMyTmdqVFFYKzVJZUVKbG1wenRHRDJ5Wjdzb3Q1WERITGJkQW02QWExWnZj?=
 =?utf-8?B?c1hVMXBvcmtMZm9mTW1ncFdjSFhhZkg0M0VmYW9zY3hlRHQrcndRVVYxbzN5?=
 =?utf-8?B?MlJCYytFY1lINjI1N2RVcXg3VjBiN2gyVUpZTGU1R01PanBjNzlSMGFLclZD?=
 =?utf-8?B?a1BsU2sydjNPQWFTTm0yUThHR1A0Z3JYTnkyYXBBUm16Uk1XbW1CeFNBa1k0?=
 =?utf-8?B?azdBa2ZDV2JhL3YxblpQQzYzcnErM2xOeFA5WG9YemovM1JFcUdsZC8yeWJs?=
 =?utf-8?B?N09QRHRiZkJnVHQreXNaNFR3QkhxMnhFOFlvY3A4S0xIMUZLRHlGL0Q2d0gr?=
 =?utf-8?B?eGYya21Nd01GbU1KdmVJaitESlB3MFlHbHNhQ0Z4NmtpelZTcDNIc3loOXdk?=
 =?utf-8?B?SGU2YXNjSy9ISDdVVndkL1hkL21xQ1ZFMUxJTm90djgrT3I2NTA2OU02elRG?=
 =?utf-8?B?NThoSVcxamJBNEJJc0JFcUd2ZkxacUpYbWR0cWV5RDN0VmtJOEFRaFplOG1q?=
 =?utf-8?B?Mm1Db3lzMXo1blZzNDhzSS9oeithaXhjTVRNbCtxSTZ2L3RBZ1EzZnJteGgv?=
 =?utf-8?B?SjA4dzRkVG1oVyttYXh2ZmRPMzJiL1lpbzlzdmtxQXdLc1FKWjBZNW4yQlky?=
 =?utf-8?B?dGJ2a08wWVFhVHlSeW42dzNyL0hrWnM5TGRJRWFGK0NZNnFCRHdmTEYyMDBT?=
 =?utf-8?B?ZmFuUG4zY3pKTWd5elByZ2JaaFBkMUJXL3hicVBYMlMvUWZIZHk5cUZCcFZi?=
 =?utf-8?B?RGRGLzVRL2Y4SnYreVRqMjVtaEhtN1Z2SG9Cd0QrTng5TlNpZksvQmRxL0FP?=
 =?utf-8?B?WUIyK1M1ODhkUkR4YVl4MkdCWU53UDYyV1hHTFJHRUtpZkxjUUg2ZDdiZEw1?=
 =?utf-8?B?c0ptL0c4UWgwVEtkaXZKQjlOM3BBaXMxOE5LWVJwUHkwa0RoWGU1eGVlNDVy?=
 =?utf-8?B?QzBncU1NQVVpblAzaFl3bTEweGI5b0ZNNFVPN3JSNXYwNnJRL1pqVGtMeUtS?=
 =?utf-8?B?aWdwUERSL1c0VlViNUFWeWc5bmFHbWpLbjZiMEZaNkJPTEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4269.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFRCS0N5bTRnL2pBRWpYL0tMT041Q1d6YzdlSnVMSEN1ZW9PWjNaZWU1SUpL?=
 =?utf-8?B?d1FQWDdybkJGR3F3d2NBRmo3RkE2YVZScCsxMC9nWVlySjMrL1N4aW9vZkRq?=
 =?utf-8?B?NlBTait5bGFYeExRSWwzMDBDL3RDVU9yekwxQ2hsMGd0SHFzQ0VRRGhaL2Jk?=
 =?utf-8?B?TThyQW9PL0tPVWMyQUpoUnBFZUdjZ0JQVjIvVSs2ZjdhQW50OFJIM3FiVUpZ?=
 =?utf-8?B?NkdBem9nUE1aZ1BpbFdoMVJDclgzbnVxSm9hZlVlUjF2TGQybjlVQW1RS21Y?=
 =?utf-8?B?aVg3WitZNEZpY3BOOUxwVlN1WWxwQUgyMjlNdGVyOU9WcUllN0xpUHBqdGhr?=
 =?utf-8?B?ZUYzNUtOY3IrOFZ5RlpkOEJ0WkhCbUg2RDluV1JTYUZ2OU9YMmJkOFNZaWsv?=
 =?utf-8?B?eUNKdUdYSWdkajJXVUQxTkpNTVlSa0t2WDFVNU1QaVZmeDc5OW1jdDJWYkxW?=
 =?utf-8?B?K3NEWDQ2V1JJeFNGSTNtQ25tbndtakZ6Y242b0pIRDIyNVBtQTFYbC9GeTkw?=
 =?utf-8?B?Um8vRVNtR2ljaHVwSERkRWx4eDdaSzNSbEtVSHdWMnJmcVZHbWZURVZPUEpD?=
 =?utf-8?B?WWNGMENSZC9BOXJYc3JSSEY5YVhuMzhqRGNYMFAxS0FpVlkwSFRYT2ZlSFF4?=
 =?utf-8?B?M3hYUFpmMGhubnBYK2d0WFh5ZGdnQzhQa2wzZmt6VzdwYk0yK0NrZVBGdVY1?=
 =?utf-8?B?TWYzU2s5cXNscHcwWTNwa2dlZjNUWFhTL3o1TjJ5NUp0NXU5b3k2MXB3dWt5?=
 =?utf-8?B?ZUtFcEhGTDN0UnRMekhrRXM4NnF6RW5TUEtjdDlNdzN2Y1NuOGluVmhiQWlN?=
 =?utf-8?B?QXJabjh4MEplY2hEbG5GdHZudGVRM3F1ZGVBUTRmaWFGVS9sSVBSU3dzZXBy?=
 =?utf-8?B?RSs3b05kM0JkT1ZlK255RWNuT1BNRHdIVS8rR0RqclNkanFTWm5ISWtlWnBo?=
 =?utf-8?B?UUxPSWR1Z3JJT2xOem1rL1A5VnZkRmZTSjVaN0VNZlpNR0ZieHNRckdFa0hL?=
 =?utf-8?B?SlJqaVdqQ2hoc0g0Q3ZTUWxtM25iM1g5K3BYVzZ0L1NLcWQ1R1JQSXhUQTE5?=
 =?utf-8?B?aGs5MnV4TUN1NFpjMEtLSC94VEd5NUtVaDlzNUpIZUtHVHZ3VlFiOW5lQWhX?=
 =?utf-8?B?L1lLSmtKaEpTRFZJa2kyOENLNFE0UktUbHoyd2MyV25VWEsyY2RuUzZwYmNp?=
 =?utf-8?B?cC93TjlJUHhpaUVWMHhvRXBPS2ZZZldyV2l0STJKU3BNWjlLWDhYeU5GYXdy?=
 =?utf-8?B?eUxJc1FpNXhuVVpseUlXRjBwcWxqYWtCdDdBM0tjSlJrQktDWEpYYXpRZENU?=
 =?utf-8?B?ZWZMWXRFWXpMTTRlcGl0bDFIM04zNTZlYXJENzJKR2JsK0hhak5odThxLzBq?=
 =?utf-8?B?RTExY2lPSkNhb1cycHk1ZXpPeHVpdzhXSkdhQkFkMkc3ZDR6YkExM1FVVUcy?=
 =?utf-8?B?d3lHRzdhN1lEY1V6TTUwR1I0a0hIWDF2bkU1TzRub2E5V3N0eVR6bGdVc1Jr?=
 =?utf-8?B?bFBTWk5QQUFGSTRleXZvZ0pab0VRR21qYkpMMXJKekRLZ0psNWRLcmU5aHdH?=
 =?utf-8?B?R1NrQ1ZZaXRUWU1uemdHTGJ6N05tUGZqMWYxMGdieUFVSkZUdk5qNEg5WGVs?=
 =?utf-8?B?NVVRbGl2TW5uakUrUkoybWdScTFMaml4d1BnbGYxZk04UGFubklrL21VemVB?=
 =?utf-8?B?ZWRTclVDRGQwOXNFQkFmL0E1dGdHb0hiS3RnR09nYnUzOU9jM0xaV3BjZmRk?=
 =?utf-8?B?Nm5PRDdJWTExdS9sUFF0Qlp3ckZVMVlwYjFiSkE4NG41bDZ0ZXhnMFN3dC9M?=
 =?utf-8?B?My94eFFUa2JPRFJ6dExmSy94YkZwa3N2ODBTVnYzUW1LWTZTdUdRQUlTb2k5?=
 =?utf-8?B?Z2JBZ1I0Umh0dnVWNDZlSzhZVGVidS94WGcvRUhQenp2ei9JUWhFUkJ1Ukw5?=
 =?utf-8?B?VHEzWUJmVjFEdUVGbENYSU5lUXBuNGt1M0Q3c2ZvOWZvOURxYm42U1AzMy9K?=
 =?utf-8?B?ekgwZUF5d0Q2NGlCZXdVM0gxdnk2RlorWWZEc1NaNU5EM3RSS0VQZVFZWElT?=
 =?utf-8?B?RWVBSnBrbU1mR1JrVGlNQkpSUVZ1aml0aGlxU3d4S3BRQ0VaamY4QnFtVGpy?=
 =?utf-8?Q?cb1saQWxJINIbvUy3hv/H3pcs?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4269.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d88685c-4887-476e-64d1-08dccb4b33ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 12:31:43.3581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJMXCxMLJ6oNCmD5Z7+IuIRU1blXC6dZ926bCuplgVol0geNfMY27v5agRSFxXQm41TtMSAj/Y1JLukQh8hTXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4851
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 2wRbs9O6ImICDC1bj40AU1V8JTl6aznC
X-Proofpoint-GUID: 2wRbs9O6ImICDC1bj40AU1V8JTl6aznC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_02,2024-09-02_01,2024-09-02_01



> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, August 29, 2024 9:20 PM
> To: Shiva Shankar Kommula <kshankar@marvell.com>; Willem de Bruijn
> <willemb@google.com>
> Cc: virtio-comment@lists.linux.dev; maxime.coquelin@redhat.com; Eelco
> Chaudron <echaudro@redhat.com>; Jason Wang <jasowang@redhat.com>;
> Stefano Garzarella <sgarzare@redhat.com>; Nithin Kumar Dabilpuram
> <ndabilpuram@marvell.com>
> Subject: Re: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
> segmentation offload feature
>=20
> On 8/26/24 14:=E2=80=8A23, Shiva Shankar Kommula wrote: >> -----Original =
Message----
> - >> From: Paolo Abeni <pabeni@=E2=80=8Aredhat.=E2=80=8Acom> >> Sent: Thu=
rsday, August 22,
> 2024 7:=E2=80=8A41 PM >> To: Willem de Bruijn <willemb@=E2=80=8Agoogle.=
=E2=80=8Acom>
>=20
> On 8/26/24 14:23, Shiva Shankar Kommula wrote:
> >> -----Original Message-----
> >> From: Paolo Abeni <pabeni@redhat.com>
> >> Sent: Thursday, August 22, 2024 7:41 PM
> >> To: Willem de Bruijn <willemb@google.com>
> >> Cc: virtio-comment@lists.linux.dev; maxime.coquelin@redhat.com; Eelco
> >> Chaudron <echaudro@redhat.com>; Jason Wang
> <jasowang@redhat.com>;
> >> Stefano Garzarella <sgarzare@redhat.com>
> >> Subject: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
> >> segmentation offload feature
> >>
> >> On 8/21/24 21:=E2=80=8A28, Willem de Bruijn wrote: > On Wed, Aug 21, 2=
024 at
> >> 6:=E2=80=8A03 AM Paolo Abeni <pabeni@=E2=80=8Aredhat.=E2=80=8Acom> wro=
te: >> >> The
> >> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags >>
> >> allowing respectively GSO On 8/21/24 21:28, Willem de Bruijn wrote:
> >>> On Wed, Aug 21, 2024 at 6:03=E2=80=AFAM Paolo Abeni <pabeni@redhat.co=
m>
> >> wrote:
> >>>>
> >>>> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type
> flags
> >>>> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6
> tunnel.
> >>>> They can be negotiated on both the host and guest sides.
> >>>>
> >>>> One constraint addressed here is that the virtio side (either
> >>>> device or
> >>>> driver) receiving a UDP tunneled GSO packet must be able to
> >>>> reconstruct completely the inner and outer headers offset - to
> >>>> allow for
> >> later GSO.
> >>>>
> >>>> To accommodate such need, new fields are introduced in the
> >>>> virtio_net
> >>>> header: outer_th_offset and inner_nh_offset.
> >>>> They map directly to the corresponding header information. The
> >>>> inner transport header is implied by the (inner) checksum offload.
> >>>>
> >>>> Those fields are required because a virtio device H/W
> >>>> implementation performing segmentation for UDP tunneled packet will
> >>>> need to touch the outer transport protocol (for the UDP length
> >>>> filed), the inner network protocol (for the total length field, in t=
he IPv4
> case).
> >>>>
> >>>> Note that segmentation will additionally need to touch the outer
> >>>> network protocol and the inner transport protocol. The first is
> >>>> implied/easily found with trivial parsing, the latter is identified
> >>>
> >>> Trivial because Ethernet header followed by IPv4 or IPv6 header is
> >>> assumed? I.e., no level 2.5 headers like vlan or mpls to complicate
> >>> matters.
> >>
> >> Yes ;)
> > Hi Paolo Abeni,
> > Apologies for joining the conversion bit late.
> >
> > We are using VDPA-based device along with DPDK in our environment and
> > have noticed a significant performance drop (~8-10%) when reading
> > packet data to determine the [outer]network header type in segment
> > offloading cases as segmentation offload needs to know the start of
> > network header.
>=20
> I'm unsure I parse the above correctly. DPDK is reading packets from the =
VDPA
> device, when does segmentation offload come into place? I guess the DPDK
> application is forwarding the packets towards another (VDPA?) device?.
>=20
> There is no encapsulation protocol at all right?
>=20
> The idea of adding additional virtio net header fields for plain GSO pack=
ets
> sounds a bit strange to me.
>=20
> I guess a more detailed description of your scenario would help.
We are targeting vDPA offloading as our use case. This involves
configuring vDPA based application on the host to directly transmit
packets to a virtual ring(vring) with specific offload requests, such as=20
IP checksum offloading or TCP segmentation offloading.=20

On the other end,  we have firmware running on ARM cores, which
processes the incoming packets with hardware assistance and=20
forwards them to the network.  In scenarios, where the L3 network
header start is not provided,  firmware must parse the packet to identify=20
the beginning of L3 layer, which introduces additional overhead.=20
>=20
> Thanks,
>=20
> Paolo
>=20

