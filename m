Return-Path: <virtio-comment-return-7188-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA34C2FC04
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:20:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 14B45CB124
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:20:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 04890986400
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:20:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E717C984043; Thu, 17 Aug 2023 05:20:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D835B9863F0;
	Thu, 17 Aug 2023 05:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n167AL6a60AyFCW5Uttn8cyAa3lBo0eHYkk8TY9ostX8VjXMg9o4jpvx1tSL+E+bC5xe36nAQ3Cn0MBGEyx8wCGiYFBvxk/7w/oFd2MauabtoOAg0aTWy14XESJRAfqpNX17AgXnMdo6R6e792Z4XzrJpuZbZ1Gg1ON2vpgw97zBOKydrk0gT8Sp2/i93PTpO0CRvyG6dEgxWAxx4Xa/R+U/ZmGZdteEoWzAtUQrd8cjhfj5vbVu12k0HX2tgUjUa/31eI/urbd95dLkAmegkBkCoIuIuLlj+b9XgxhDx5aGs1zf/BvcKcqfSPqz+YIQrVLdMe5OtICyR8NGiAM6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HXSHa/fXEspPVy0PEImcBj9o90/Xz8VJk2FDLlNgn4=;
 b=mOXTEndTMKehCTnF7cxQjKJykNIHN5leJXhwnd2CPkpfC0fSQaA+rJjvX101x4ZpebKdAD640L3Y5mdOWgReg/u2YGZdPDy9XjZjLXnIvG2UQRMJw/WlkyOLZrFVeny3KrvePC06TXuWXuKs/FU88K95e36HM1VPMO0ga4cOTdi3guejoWv+UujDOKOCwxyTm1tV67N9ePmg/Sc2ijmcZBVEZBmBCPIpbtEMb8/Kx+neOh1K3PRg89imxnddQrCyJIUOfdBr13NCOkzwXQUrwu04GxH5yoer+WwKxB+GDupjQt4Ito9OyJNf2GccUK2pm3V8hJMD+xRdjrUu+R8EbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "david.edmondson@oracle.com"
	<david.edmondson@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>
Thread-Topic: [PATCH requirements v4 4/7] net-features: Add notification
 coalescing requirements
Thread-Index:
 AQHZz0yaD3nRfQHwDE2VYaiYBbnhPK/smUSAgAAkuxCAACAJgIABEMsAgAAFvgCAAAHRYA==
Date: Thu, 17 Aug 2023 05:20:52 +0000
Message-ID:
 <PH0PR12MB5481502F616CFEEAD01D4CD2DC1AA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-5-parav@nvidia.com>
 <6b48e787-7910-4714-b0a6-ea118c6a072f@linux.alibaba.com>
 <PH0PR12MB54815DBA73F066BFAE3824CBDC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5ce972f4-1efd-400d-bc45-c03e9956f2ce@linux.alibaba.com>
 <PH0PR12MB5481D1A5BA1DD59AE4B6C58CDC1AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <3b43db27-08cb-4fd6-b63b-a885b50044c6@linux.alibaba.com>
In-Reply-To: <3b43db27-08cb-4fd6-b63b-a885b50044c6@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5780:EE_
x-ms-office365-filtering-correlation-id: 5b4296d6-9cfd-4a63-4b79-08db9ee1b9ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rq88qQcIHtElvaCW4SNWkGLkqJCon+AI/BFXWDtkH3Zz3U8VUg9On9O1+ucbtUyrKefez5IKLzpNgoye8jiZk9dPD0h/GOJscpaNInM4rCW8GlK0t9qsRy6arV1Y2F7RaOMPg3ql4xTFy4djfIGcryNQmzF7DNHHtoOptiqbBmNaUQJTdlbC3XVCr/6u75sXaRv9dLgjUpOm5CiqqEYzzFoQzCFZ263zxTjxUdfbkrTXvizCyr6cOxt43SddMpsnNM+8o8rNrVueq8Go6aGk0mQk9Zvy7M8YDoLCc6jnMUe90wmlVpJ+uAXZzb6l+SenAN/KJebJbnB+cZxyGHBXC/Knbn+uPcA+epcOQmjFv+gZxUzOpR2+nnx5ON7tO0Cx5VW70MaxA8i4McDrHLFA4gvS2hSY8KwOEYm85byyXj0y37TnCJSN823craTyfKKX+DxvBa6oNqSO0AtvyIuPW3I0qbZ7h+dQ3XGkg4Z+XxeNaSuayZ9iqpzudOHyXERyMs+QTH1Wj2OvB8dz/r85LcLyf/uT0kYQACMR1FNRHu4RauTWvmV4zLBVbQFm8ByBT0y20bqMD92Z4y/cfSzpM7ZRg5KpjX3oG9KiG9bZaVkCW9mE9/X6wF4OeUTOFCbC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66556008)(64756008)(76116006)(66476007)(66446008)(122000001)(5660300002)(41300700001)(52536014)(38100700002)(38070700005)(4326008)(8936002)(8676002)(2906002)(4744005)(55016003)(478600001)(86362001)(9686003)(33656002)(7696005)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEhyek9vSzRMb2RXem5uT0xBR0JXTjh1L0VyanZDakFpbzRNWkJtWVY2dFM3?=
 =?utf-8?B?dm1zTExQM3BFNGdpelRQbVhBN0RVL2daclVXV01UWWFyeFBRenhLK2IzbFU3?=
 =?utf-8?B?Yml2cGk4dHFmVWtkQ2ZUMmJrOXNsSDJjSWFPWGZyNEE2OW4yTUhMdGlDME0w?=
 =?utf-8?B?MU5YNGthY2Iwb0dkendKVlZBZzBURThLSmY5ajNMbHc3U3JNT1BMUUd5TEdR?=
 =?utf-8?B?YmpZdTByMEduSjlqOHRWRkQrdjlyd3JpblpqRy83bEo4aVNGcVZtcE5BRWI0?=
 =?utf-8?B?azBlZUNTbWR1Tllnd3V0NnFtcnJ2Z1dDWEpEakRMUWxBQkdJd2JLbml2UnVr?=
 =?utf-8?B?YS82VWJObmJBYUdza1BkNnBiVGN1SWVZQytTSHY0ZGcvU1NmWUsxNU5hR1pC?=
 =?utf-8?B?M1A0N0dZUXovVk5xeC9mdVZzWkxZOGlrSVNuYUlCRkpaMGNHYlBUZnNYcng1?=
 =?utf-8?B?UGd4TTdnSUZMdHVGRnVGb2JyWis4QTRnWWRHYVB3c1JRSFBzTldnMC8yTXpP?=
 =?utf-8?B?c1dabllCdkhLTDBGSWRXdUFSeURWMHlBM3JXdTBJMURiYnA4N0N0VUtiR2xi?=
 =?utf-8?B?TURyZFJMV0VLTUtmMko4cE5uOUVDWmcxN29hbXVVSmg4VlhtVmZoQm4vbzFk?=
 =?utf-8?B?am9mU1oyWG4wRzZZOFM2QS81aG9jTGFNWHJhMDFqM3l3VUQ4aVBwalBETzdr?=
 =?utf-8?B?Y0N0bkkxSVNEL01wNnVFaUgyNWRBSnY4c3ZFOG93d3VqRzYzdjRYUGtrbUgz?=
 =?utf-8?B?RkhOdFk2SXdSZW1GK0dkamU2cXlkSk0raEZHU1VGeEFVWksvWmx5ZjF0V01H?=
 =?utf-8?B?SEd3UFM2b0hWbnFpWThySE9zdncrazhtc0FLNkt4SThuUnJHZDAxYTRaMHQy?=
 =?utf-8?B?UzU5SmZCSk51RnMrbVBqblgyaWJyR1JOQzhmVnRXcFZZVGdDN0wyMFEvNGFj?=
 =?utf-8?B?a1BSSDRoZ3BIaWlvOWI2YUVIZy8xOHYvSzFoRy9GS2V0anFhaGNGUnFsTEhm?=
 =?utf-8?B?U2lOSkFJVlN3WnZOa3VjeUw0ZEZLdktiRDBJMm1Bb2hNWEkxT3VvMW1CSVow?=
 =?utf-8?B?a2NIdmU1RXpkelhFT202UExuTkV5RCsvUExkMVZoeVRZTG1sa3ZFOVo1TmI1?=
 =?utf-8?B?RTIrcWozYXBlUE1wU2s5RnR2THlGR1ZmOGt4TzZyaG5vSlFDaTVqV21Kci9k?=
 =?utf-8?B?a2tXUDkxSDl5MjdiSmdGU2FaVFpMSWtsODJNZEpMaFZnZzdUa3lpczVFV0w4?=
 =?utf-8?B?TEZnY0hFakYzS3M3MWlOQ1NBUkJRM0R2UW5hek41WitMeXJyTmt5bmdmN1Mx?=
 =?utf-8?B?RTBXSXVuYnNaeXpjRldQSlA4MGxHU0R2YXU2V3hEMENnMzMzbVdLa0UvVWRs?=
 =?utf-8?B?bjFXcXFiREhCL2RPUjA2T2pLanA4aWFtL1plY1pTRU50M0xpZko2R0NLWlBp?=
 =?utf-8?B?bXhyUTZiajF1THBDaHo5Z20rNWNkQkdmSlM4RUoxbWM1VG1wMC9HNDVMK1VK?=
 =?utf-8?B?SzVaTjdZZktsWERyVU84QkloT05ZeENKc0NMM0RiWERnS01aNWVhRVNRS2Q1?=
 =?utf-8?B?MVVLRHdmMXRrT1hTdFBUVUlWSEJVWlNHVFZRMlZDaTRCbDN3bmFTMG1xemMz?=
 =?utf-8?B?eTRQT2E4YVhCeXhxd29qdlV1bEpUWlVLbzdGa3htaXFoOW5meGxoRXo1azNl?=
 =?utf-8?B?eXlqVDcvWEk3cU9kVVNPNGxVcEIrd1lCb2xQWTVveWZ4ZmpINmhhbVNYbGxq?=
 =?utf-8?B?dWRxbEk3a3RKaFEyZUxpR2ZVWStiTjVQdi82VHpGSTlYbk9sd1h0eXNFa0Qw?=
 =?utf-8?B?dFpXN040bHZPZ0J1cEtDVm5GbkhRM2w0d2VtU1ZPRDl2YlhGcWRFUjBiNGd1?=
 =?utf-8?B?VjBFR2xPOTFINGhmZ21MM2w4eU92NzJDYnk1blVRUUw1ZERmQ1lGSzlEaVhS?=
 =?utf-8?B?SjMyM3IyUVF0WjBsUUcwd216WTF2aFAxZ1J2bTJOdHhHSlprZXpKaEo2VTlW?=
 =?utf-8?B?R1RhVzNZRURJc0dWSDExc1RmSHorQTBMZGtWZTBhWVM1NDRRM0gzRnpxbDlQ?=
 =?utf-8?B?OWZ2L3VPb1YzZkNITFpuY3EyTWRFT040QUpsbTRNM1hjaDFKU0sxQ0J5ZDY2?=
 =?utf-8?B?dUYzQzJ6aXNSZ0FBL3Z1MEJML2xmalVVSG9zQ0hqV0duRE9pcWZULzErOEly?=
 =?utf-8?Q?k3Y2biGJ0osCmSh04T+n3Go=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4296d6-9cfd-4a63-4b79-08db9ee1b9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 05:20:52.2704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMIjOqDpIsOPrMeaAC0AC57mdN5AFridxlEjzFoRElOrOU6ByBrMDPS0CqY1WgX73Q3ZytIqaMRb5lMStgMphg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780
Subject: [virtio-comment] RE: [PATCH requirements v4 4/7] net-features: Add notification
 coalescing requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgQXVndXN0IDE3LCAyMDIzIDEwOjQ0IEFNDQoNCg0KPiA+IEZfTk9USUZJT05fQVJN
IGlzIG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIEZfRVZFTlRfSURYLg0KPiANCj4gT0ssIEkgdGhp
bmsgSSBnZXQgeW91ciBwb2ludCwgRl9OT1RJRklPTl9BUk0gaXMgbXV0dWFsbHkgZXhjbHVzaXZl
IHdpdGgNCj4gVklSVFFfQVZBSUxfRl9OT19JTlRFUlJVUFRcdXNlZCBpZHhcVklSVElPX0ZfTk9U
SUZZX09OX0VNUFQsIGFuZCBpdA0KPiBzZWVtcyB0aGF0IEZfTk9USUZJT05fQVJNIGhhcyB0aGUg
aGlnaGVzdCBwcmlvcml0eSwgYW5kIGl0IG5lZWRzIGEgbmV3DQo+IGZlYXR1cmUgYml0LiBBbSBJ
IHJpZ2h0IDopPw0KPg0KWWVzIGZvciB0aGUgbmV3IGZlYXR1cmUgYml0Lg0KU2luY2UgaXRzIG11
dHVhbGx5IGV4Y2x1c2l2ZSwgdGhlcmUgaXMgbm8gbm90aW9uIG9mIHByaW9yaXR5Lg0KIA0KPiBU
aGFua3MhDQo+IA0KPiA+IChMaWtlIHBhY2tlZCB2cSBpcyBtdXR1YWxseSBleGNsdXNpdmUgd2l0
aCBzcGxpdCBxLikNCg0K

