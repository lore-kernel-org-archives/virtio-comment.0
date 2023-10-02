Return-Path: <virtio-comment-return-7583-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61A4E7849A
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2EE9D42D67
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0C2C598669C
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:20:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E9F17983FE6; Mon,  2 Oct 2023 05:20:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0841198667B
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Oct 2023 05:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxiHW0iej9O+npipkKoQxMPaaRbtIAlSDfnzqIi5D8dDaT67zfxxBo6hO8iFeaSN59OZN2uyYSvA8CXHPaBZs8jWStlRVJ1rYm4e02vhq36fN8vN2aNX+u7Y1D1u9n17A5PcngCcOFVP20Upo9jiH6VJOJmXNosUda6bEzR8T8mnmoxgzLELERZP2CodyxENnGMBBRToA9YEGd46dGQQLfILX4r6lQSVKs79cP4F1Ev/GVyjmM5ieQ+4BVNZs3DUnBKTarmVkL1aX0Pue+kRD3VuxV8GO3IzE9zz0kVNveMEC1iLGbm9bClECDYswQo/6Cq1J3G0L0tLi82skEHqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5K+ID4tqNBXPmsZzI2v75UwBxr82dNdLozgIA7HhO4=;
 b=WsKnBrENypH4tYN0VGlOmOBkmstHD5n5xUMOHsopeMlnAWr/xMjaYrriMnxl5k7nI4z5VwWrXpXsE5yiNzy5btMuCC+FKdSA0Jsq/VA/0ZLoE24HyqqnumryhPn3wx3TW1UZbRePuB3fiy4A6/7jbETa6u3vHl/SHZqMw6jZ9wKonNTNH55jFsEoxKgAsLrCWkWGYjjQfbGzfjOMH8iqMsqMfdJ853PJCW9xFHCz1PGZQOXA+ojJ4/jhTqT2AWEMRg1qmdBFBGZF3BStXt6f8DzGYSlk0G6H+0PFM6HdWLvp/hb/f1yS+ppYa/IL2tJ3ts0dWrDB4CXmxq912OxrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Thread-Topic: [PATCH v3 0/2] Support enabling virtqueue after DRIVER_OK
Thread-Index: AQHZ9O+aMt9Foa96jkaKzO+VCfy5erA19cYg
Date: Mon, 2 Oct 2023 05:20:11 +0000
Message-ID:
 <PH0PR12MB5481828A211C0EE78AB63113DCC5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
In-Reply-To: <20231002051601.6626-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6860:EE_
x-ms-office365-filtering-correlation-id: 7e3c0247-66b8-4c97-ab09-08dbc3074080
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e+zS1kVCdzoSIpx2K0WVnGeiSl7r2dEUG/MW5OccIj36nN7s/Z3ze9qjEwPDCwiP6BKoAtbCJQC4gf8b/6zOxchlp1EU+wuqCsTSsUQaRMDvTL9oSNShVJlYJuKj0T7rACqSR/NJqguzr4cQrUgHfYySMTehjwkeDtc4r4fzxOio5p6SR2rrGUKU2fWh7LpMvnmQNZ0GNAh64RAsOQzGzA+JDyNzu5iKUKsvG2nUFX1sftpDbczwqqvMohXzDGjjz6qasf4yBBJENwpaRzrTTeiGbe4ffEIgxONjpQbxoD9tzGqz9LP7EfhVaMgemKZ4FEz3gdE137cKTLfOxdgpvEW+TS0gjKCVU/OaKqMJs//zTjRhIUZe1bxxUBM/8o62kWdFJuby0yn2djxdzc79eNtU7BiaBOcu97Ee9iYEAt+pJFdj+HJ5Q/P6m1VybgVBEE4ixF8W2QLvIO4n1u8zsgI+lEppkabwQTH6xb08U8gdE/XI79u3axuLf9htaRsDfgmHo6JaHCHDjUB4UuyXOYslu/STbEJE+JAcdPwYn1mncYtj6ZYHdUjoR8xSx+idAY3axY66zjFolvGFATWTAjuEu3qXL8TyRzoRVFeOOUgqKwFc2NrRDS9Ors/kUSFjBBbD2DkSUzCLokIb3JxxIyIq1azadk7Q2VsBdBG458Gk1/6KH5BDf8lvqm7fN1yKa2V81Kvm/EBjr/OBNVklhQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(6506007)(7696005)(71200400001)(478600001)(966005)(38100700002)(122000001)(38070700005)(86362001)(2906002)(41300700001)(83380400001)(107886003)(9686003)(26005)(33656002)(66476007)(66446008)(64756008)(5660300002)(54906003)(76116006)(316002)(66556008)(110136005)(66946007)(8676002)(4326008)(52536014)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTNBSVZ0WWZwR05TWXczWFNFc2lUUzlhL3V3M294ZFd2bldyQm9jWFBUaUVO?=
 =?utf-8?B?dUVPc1plRnhNK25DUHVuREoxeXJnMzFZcU0zVFA3UGozOEE4cUpvM2sxbHJV?=
 =?utf-8?B?K3o2UDEyc1B5NmlORHNNcy9MSmJ6M3lzR0dBd2JVU3dXRTg5NmtRYWI3REc1?=
 =?utf-8?B?aHdJT29zZFVPblM2d3BUUzRZdGVsVk9vUnd6aDVoSjAzQ1Fnd3FlUy83VVd0?=
 =?utf-8?B?QVdHamdzWmFaaXo0TzF0aFdOdzFnR3JSS2NjVUw0VzdheStveFd2ckdBcG9U?=
 =?utf-8?B?RzZiK1F5U2YzRk1mYUtuWDhCNVVicVRiQUEwY2VURzM2NkwwSXlka2NCMFdX?=
 =?utf-8?B?emtOVGZzd1RVVVRSb3Y1VkxOazhPU2ZQaFpNcElxNG1KNVFac2F4OTV2TU1P?=
 =?utf-8?B?b1lXYjRocjYwZ0l1SnRpbkxIamV6RS9XTlZ1ZWk3eE1GVitQaTErand3Vmxp?=
 =?utf-8?B?blBVa0kwSTZBcW5tYmpZVkxmMzBXaldmMFo2R3hjUzg3Zm1zMzZ2OWFZZkZF?=
 =?utf-8?B?eW9FMGhTOFhTR3h6UGlwcExhTGQyMURGZ3FReW9rbWtDSVVtNXVxQUtNN00y?=
 =?utf-8?B?NCt0QzA2WE4xajFmK0tiMnc1bmtiUVdiNkpHVXd4bW5ITXc2ek5WY0tQZ0hY?=
 =?utf-8?B?WWp4TjRXbnNmbk43VTA0YXYrTFdTQithRk1CdFhueUh4bVFLd3c2RzNGYnJZ?=
 =?utf-8?B?dHEzTFNQWnErVGh3K1ExOWpZMTFkczZWZWFaQ25rODFWejUrZ1hLVklSTG1X?=
 =?utf-8?B?UVZHYXJTMDlsR3d5akVIc1lPZXhuU3NobThxTzd1Yk1ySHhEbXVaTE1Ob3Jj?=
 =?utf-8?B?UEFnWWpoUVg0WjluT2FLRUtaYUxKaTZ1TTh0SFFUMmg4YWJIYnBQWHluWmQz?=
 =?utf-8?B?VmlUN3ZOWUlXMDIvSzZzNkc2clFGcG9XbU10Mk5tS0FORDBPV1pQdCs3NVAx?=
 =?utf-8?B?QjhYZnM5YzNCWmpMdXVRV01oRnFId3F6MHE5ZkswRE4zdFdibGZjY3lEUFVp?=
 =?utf-8?B?SHh3eTNrc3FuRExDWDIvcldSa1pudjBrRHZUNVhGcEV4NnRoNDhwUDdjRXA1?=
 =?utf-8?B?N1hNVi9KeUxqWXUwZnA2Y1I1Rlk5akIxb3JKMVNEQVZRYzJDd2krek4vajdT?=
 =?utf-8?B?YXg2N0IwNUVEb2FMZldPWXJsOVJUY2lQMEZjRGNzeGlXTmdLQ25XQnlOekU2?=
 =?utf-8?B?RE9zekc2bXAyUkhSbUx4YjJnelZPdENCV1Y0cGpwU0dNQnhFVm9QSDJheGRE?=
 =?utf-8?B?clZqSXMzS3JZMVN2bjhaTTRjUGF6L1RmYUF0dkIwSlJacFR6NDFva01MMHhu?=
 =?utf-8?B?d3BsSVRTTHNVS21NcEtFS1FtenhReDJsa0UwclJRUTU3OUlXTDhzaGliNGdt?=
 =?utf-8?B?SWJTZWM3c0RTQm5GNGJLK0tub1BDeExFazlDVmpmd0RhNW44WkkxeWowNWZy?=
 =?utf-8?B?N3I3VjBPR3NPNXl6QmdJenBrZkEyc1hHeVRJY1FueGxpeEc4WGQ0QU1Vb3Bl?=
 =?utf-8?B?dWRsQmYwMHN2Umt0UWJpZExVYWZSSVIybHcwNTcrSnpFejdTcnN1aWY5RDA4?=
 =?utf-8?B?cHEvMkF6VHA0dkY1L2QxdTlGM3lkdXFCdUM0RDBpSXF0TG12OHZDR3pXSytO?=
 =?utf-8?B?ZVVZTm5McFlPUndoMHU2WENwU3NBZHdzNEVpSldNQ1diSlJOOCtNVnVQaE0r?=
 =?utf-8?B?RlFqeEdHTlJBeEdrTE42L0xWcjNZd0Ywa2VxNlJiczJEb0pyNlJ1M2JmNTRn?=
 =?utf-8?B?d21TZFhwMkw4Z3oxUTBLdUVxWXM5UG5CSHRCeUFxRWEyNHJDc2swYjltRm50?=
 =?utf-8?B?R2lJQWZTb3NxeXZLUFpqd1UxVEo4K0NFUk1BVzlESXFkYkUxa0VZajlKSFJZ?=
 =?utf-8?B?SEVqNUliSVN4RlJMR0EyRGhrRHhOVzFFbXdKblBPcFovdmNLMFBxQmFTSWFv?=
 =?utf-8?B?T0daakdFREsxM2d2R2tLeXlaY1Y3b2dOUi95ejUrWXlDc1lCOE52NU5hbnhW?=
 =?utf-8?B?Uy80T1VNUVo4VUVOckZVaHpTQ0dodERJUHVVQkhvL3NZMWtMaTllWUxzczlw?=
 =?utf-8?B?SmtvV0dWNWhvV3RRNHlkTndmV2tDa0MyZlFUSTBYeDRuc1ZyL0N2ZnlmVE9a?=
 =?utf-8?Q?Bkd8WYTCNE7IZxeOGFqMyaIyY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3c0247-66b8-4c97-ab09-08dbc3074080
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 05:20:11.6860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fRxtN3FFCDh6YMS9Rs630GxNZWjyfiIvGnqR8o3++gT0N4SSgAqOfSS6y6NIIUPZ1WaZp0sYBoXatUTP/URMHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860
Subject: [virtio-comment] RE: [PATCH v3 0/2] Support enabling virtqueue after DRIVER_OK

SGkgTWljaGFlbCwgQ29ybmVsaWEsDQoNCg0KPiBGcm9tOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52
aWRpYS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyLCAyMDIzIDEwOjQ2IEFNDQo+IA0K
PiBTdW1tYXJ5Og0KPiA9PT09PT09PQ0KPiBUaGlzIHBhdGNoIGVuYWJsZXMgZHJpdmVyIHRvIGNy
ZWF0ZSB2aXJ0cXVldWVzIGFmdGVyIERSSVZFUl9PSyBzdGF0dXMgYml0IGlzIHNldC4NCj4gDQo+
IFRoaXMgcGF0Y2ggdGFrZSB0aGUgaW5zcGlyYXRpb24gZnJvbSB0aGUgdGhyZWFkIFsyXSB3aXRo
IGNyZWRpdHMgdG8gRXVnZW5pbyBQw4NyZXouDQo+IA0KPiBEZXRhaWxzOg0KPiA9PT09PT09PQ0K
PiBDdXJyZW50bHksIGEgdmlydHF1ZXVlIG11c3QgYmUgZW5hYmxlZCBiZWZvcmUgZHJpdmVyIGhh
cyBzZXQgdGhlIERSSVZFUl9PSw0KPiBzdGF0dXMgYml0Lg0KPiANCj4gc3BlYyBjaXRhdGlvbiB0
byBzZWN0aW9uICJEcml2ZXIgUmVxdWlyZW1lbnRzOiBEZXZpY2UgSW5pdGlhbGl6YXRpb24iDQo+
IA0KPiAiUGVyZm9ybSBkZXZpY2Utc3BlY2lmaWMgc2V0dXAsIGluY2x1ZGluZyBkaXNjb3Zlcnkg
b2YgdmlydHF1ZXVlcyBmb3IgdGhlIGRldmljZSwNCj4gb3B0aW9uYWwgcGVyLWJ1cyBzZXR1cCwg
cmVhZGluZyBhbmQgcG9zc2libHkgd3JpdGluZyB0aGUgZGV2aWNl4oCZcyB2aXJ0aW8NCj4gY29u
ZmlndXJhdGlvbiBzcGFjZSwgYW5kIHBvcHVsYXRpb24gb2YgdmlydHF1ZXVlcy4iDQo+IA0KPiBU
aGlzIGltcGxpZXMgdGhhdCBhIHZpcnRxdWV1ZSBtdXN0IGJlIGVuYWJsZWQgYmVmb3JlIHJlYWNo
aW5nIHRoZSBEUklWRVJfT0sNCj4gc3RhZ2UuIFRoZXJlIHdhcyBubyBleHBsaWNpdCBtZW50aW9u
IGFib3V0IGFiaWxpdHkgdG8gZW5hYmxlIHRoZSB2aXJ0cXVldWUgYWZ0ZXINCj4gRFJJVkVSX09L
IHN0YWdlLg0KPiANCj4gSW4gZm9sbG93aW5nIHVzZWNhc2VzLCBjcmVhdGluZyBhIHZpcnRxdWV1
ZSBhZnRlciBEUklWRVJfT0sgcGhhc2UgaXMgZGVzaXJlZC4NCj4gDQo+IFVzZSBjYXNlczoNCj4g
PT09PT09PT09DQo+IDEuIER5bmFtaWNhbGx5IGNyZWF0ZSBhcSB3aGVuIGFkbWluaXN0cmF0aXZl
IGNvbW1hbmRzIHRvIGJlIHVzZWQuDQo+IGF0ZSB0aGUgbmV0IGRldmljZSB0eC9yeHEgd2hlbiBk
ZXZpY2UgaXMNCj4gICAgb3BlbmVkIHdoZW4gZGVwbG95aW5nIGZvciBhIGNvbnRhaW5lci4NCj4g
ICAgSW4gYSBjb250YWluZXIsIG51bWJlciBvZiB2aXJ0cXVldWVzIHRvIGJlIHVzZWQgbWF5IGJl
IDw9IG1heCBxdWV1ZXMuDQo+IDMuIER5bmFtaWNhbGx5IGNyZWF0ZSBmbG93IGZpbHRlciBxdWV1
ZXMgb2YgbmV0ZGV2aWNlIHdoZW4NCj4gICAgQVJGUyBvciBldGh0b29sIGZpbHRlcnMgYXJlIGVu
YWJsZWQgYXMgbGlzdGVkIGluIFsxXS4NCj4gNC4gRHluYW1pY2FsbHkgY3JlYXRlIHJ0YyBmdW5j
dGlvbmFsaXR5IHJlbGF0ZWQgcmVhZCB2aXJ0cXVldWUgb25seQ0KPiAgICB3aGVuIG5ldCBkZXZp
Y2Ugd2hlbiB0aW1lc3RhbXBpbmcgdG8gYmUgdXNlZC4NCj4gNS4gV2hlbiBYRFAgcHJvZ3JhbSBp
cyBzZXQsIG9uZSBjYW4gY3JlYXRlIGFkZGl0aW9uYWwgWERQIHNwZWNpZmljDQo+ICAgIHF1ZXVl
cyB3aXRob3V0IGFmZmVjdGluZyBleGlzdGluZyBxdWV1ZXMuDQo+IA0KPiBIZW5jZSwgVGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIGFuIGV4aXN0aW5nIHF1ZXVlIGVuYWJsZSBhbmQgZGlzYWJsZSAoYWth
IHJlc2V0KQ0KPiBmYWNpbGl0eSBhbmQgYSBuZXcgZmVhdHVyZSBiaXQgdG8gZXhwbGljaXRseSBp
bmRpY2F0ZSBzdWNoIHN1cHBvcnQgYnkgdGhlIGRldmljZS4NCj4gDQo+IFdpdGggdGhpcyBmZWF0
dXJlLCBkcml2ZXJzIGNhbiBza2lwIG9wdGlvbmFsIHF1ZXVlcyBjcmVhdGlvbiBkdXJpbmcgZHJp
dmVyIGluaXQNCj4gdGltZS4gRm9yIGV4YW1wbGUsIGEgTGludXggbmV0IGRldmljZSBkcml2ZXIg
Y2FuIGNyZWF0ZS9kZXN0cm95IHRoZSB0cmFuc21pdCBhbmQNCj4gcmVjZWl2ZSBxdWV1ZXMgd2hl
biBuZXQgZGV2aWNlJ3MNCj4gbmRvX29wZW4oKSBhbmQgbmRvX3N0b3AoKSBjYWxsYmFja3MgYXJl
IGludm9rZWQgcmVzcGVjdGl2ZWx5Lg0KPiANCj4gWzFdIGh0dHBzOi8vbGlzdHMub2FzaXMtb3Bl
bi5vcmcvYXJjaGl2ZXMvdmlydGlvLQ0KPiBjb21tZW50LzIwMjMwOC9tc2cwMDI2My5odG1sDQo+
IFsyXSBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby0NCj4gY29t
bWVudC8yMDIzMDYvbXNnMDAwOTcuaHRtbA0KPiANCj4gUGF0Y2ggc3VtbWFyeToNCj4gPT09PT09
PT09PT09PT0NCj4gcGF0Y2gtMSBmaXhlcyB0byBhZGQgdmlydHF1ZXVlIHJlc2V0IGNvbmZvcm1h
bmNlIHJlZmVyZW5jZXMNCj4gcGF0Y2gtMiBhZGRzIFZJUlRJT19GX1JJTkdfRFlOQU1JQyBmZWF0
dXJlIGJpdCwgcmVxdWlyZW1lbnRzDQo+IA0KPiBQbGVhc2UgcmV2aWV3Lg0KPiANCj4gRml4ZXM6
IGh0dHBzOi8vZ2l0aHViLmNvbS9vYXNpcy10Y3MvdmlydGlvLXNwZWMvaXNzdWVzLzE3Nw0KPiAN
Cj4gLS0tDQo+IGNoYW5nZWxvZzoNCj4gdjItPnYzOg0KPiAtIGdpdGh1YiBpc3N1ZSBsaW5rIHVw
ZGF0ZWQNCj4gdjEtPnYyOg0KPiAtIGZpeGVkIGNvbW1lbnRzIGZyb20gTWljaGFlbA0KPiAtIHJl
ZHVjZWQgZGV2aWNlIGFuZCBkcml2ZXIgbm9ybWF0aXZlcyAoc2ltcGxpZmllZCkNCj4gLSByZXBs
YWNlICdhIHZpcnRxdWV1ZScgdG8gJ3RoZSB2aXJ0cXVldWVzJw0KPiAtIHJld29yZGVkIHRvIHJl
bW92ZSAnaW50ZXJlc3RlZCcNCj4gLSBhdm9pZGVkIHJlcGVhdGVkICdkZXZpY2UgaW5pdGlhbGl6
YXRpb24gdGV4dCcsIHJlcGxhY2VkIHdpdGgNCj4gICBEUklWRVJfT0sgc3RhdHVzIGJpdCBsYW5n
dWFnZQ0KPiAtIGF2b2lkZWQgY29uZnVzaW5nIHRleHQgYXJvdW5kICdNQVknIGluIHRoZSByZXF1
aXJlbWVudHMNCj4gLSByZXBsYWNlZCAndGhlIHF1ZXVlJyB0byAnc3BlY2lmaWMgdmlydHF1ZXVl
cycNCj4gLSByZXBsYWNlZCBxdWV1ZSB0byB2aXJ0cXVldWUNCj4gLSBzaW1wbGlmaWVkIGNvbW1p
dCBsb2cgdG8gdGFsayBhYm91dCBtc2l4DQo+IHYwLT52MToNCj4gLSBmaXhlZCBjb21tZW50cyBm
cm9tIFh1YW4NCj4gLSByZW1vdmVkIGJsYW5rIGxpbmVzDQo+IC0gZml4ZWQgd3JvbmcgcmVxdWly
ZW1lbnQgbGluayB0byBkZXZpY2UgaW4gZHJpdmVyIHNlY3Rpb24NCj4gDQoNCkkgaGF2ZSB1cGRh
dGVkIHYzIHRvIGxpbmsgdG8gdGhlIGdpdGh1YiBpc3N1ZS4NCk5vdyB0aGF0IHRoaXMgc21hbGwg
ZmVhdHVyZSB3YXMgdXAgZm9yIGZldyB3ZWVrcywgY2FuIHlvdSBwbGVhc2UgY3JlYXRlIHRoZSBi
YWxsb3QgcmV2aWV3Pw0K

